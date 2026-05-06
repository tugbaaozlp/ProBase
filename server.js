import express from 'express';
import sqlite3 from 'sqlite3';
import bcrypt from 'bcrypt';
import cors from 'cors';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static(__dirname));

const db = new sqlite3.Database(join(__dirname, 'probase.db'), (err) => {
  if (err) console.error('DB Error:', err.message);
});

db.serialize(() => {
  db.run(`CREATE TABLE IF NOT EXISTS users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT UNIQUE, sifre TEXT, kullaniciAdi TEXT, rol TEXT, departman TEXT, sifre_plain TEXT
  )`);

  db.run(`CREATE TABLE IF NOT EXISTS projects (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      ad TEXT, musteri TEXT, butce REAL, baslangic TEXT, bitis TEXT, durum TEXT, ilerleme INTEGER DEFAULT 0, kategori TEXT
  )`);

  db.run(`CREATE TABLE IF NOT EXISTS project_assignments (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      project_id INTEGER,
      user_name TEXT
  )`);

  db.run("DROP TABLE IF EXISTS tasks");
  db.run(`CREATE TABLE tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      project_id INTEGER, baslik TEXT, detay TEXT, sorumlu_kisi TEXT, departman TEXT, deadline TEXT, progress INTEGER DEFAULT 0
  )`);

  db.run(`CREATE TABLE IF NOT EXISTS notifications (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_name TEXT, title TEXT, message TEXT, type TEXT, is_read INTEGER DEFAULT 0, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
  )`);

  db.run(`CREATE TABLE IF NOT EXISTS messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender TEXT, receiver TEXT, text TEXT, time TEXT, is_ai INTEGER DEFAULT 0, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
    )`);

  db.run(`CREATE TABLE IF NOT EXISTS reports (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        project_id INTEGER,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        summary TEXT
    )`);

  db.get("SELECT COUNT(*) as count FROM users", (err, row) => {
    if (!err && row.count === 0) {
      console.log("Veritabanı boş, seeding başlatılıyor...");
      seedDatabase();
    } else {
      console.log("Veritabanı dolu, seeding atlanıyor.");
    }
  });
});

async function seedDatabase() {
    const hashed = await bcrypt.hash('12345678', 10);
    const users = [
      { email: 'adminuser@probase.com', name: 'Admin User', role: 'admin', dept: 'Yönetici' },
      { email: 'kevserdemir@probase.com', name: 'Kevser Demir', role: 'personel', dept: 'Tasarım' },
      { email: 'aliyilmaz@probase.com', name: 'Ali Yılmaz', role: 'personel', dept: 'Backend' },
      { email: 'tugceaydin@probase.com', name: 'Tuğçe Aydın', role: 'personel', dept: 'Frontend' },
      { email: 'semakanca@probase.com', name: 'Sema Kanca', role: 'personel', dept: 'Veritabanı' },
      { email: 'zubeydekaya@probase.com', name: 'Zübeyde Kaya', role: 'personel', dept: 'Proje Yönetimi' },
      { email: 'fatmanuryilmaz@probase.com', name: 'Fatmanur Yılmaz', role: 'personel', dept: 'Mobil Uygulama' },
      { email: 'omerfaruk@probase.com', name: 'Ömer Faruk', role: 'personel', dept: 'Siber Güvenlik' },
      { email: 'yenipersonel@probase.com', name: 'Yeni Personel', role: 'personel', dept: 'Yazılım' }
    ];
    
    users.forEach(u => {
      db.run('INSERT INTO users (email, sifre, kullaniciAdi, rol, departman) VALUES (?, ?, ?, ?, ?)',
        [u.email, hashed, u.name, u.role, u.dept]);
    });

    const deptTasks = {
      'Tasarım': ['UI Araştırması', 'Wireframe Hazırlığı', 'Renk Paleti Seçimi', 'Logo Tasarımı', 'Tipografi Seçimi', 'Sayfa Tasarımları', 'Prototip Oluşturma', 'İkon Seti Hazırlığı', 'UX Testi', 'Final Teslimat'],
      'Backend': ['DB Şeması Oluşturma', 'API Rotaları Tasarımı', 'Auth Sistemi Kurulumu', 'Veri Validasyonu', 'Sunucu Yapılandırması', 'DB Entegrasyonu', 'Cache Yönetimi', 'API Dökümantasyonu', 'Unit Testler', 'Deployment'],
      'Frontend': ['HTML Yapısı Kurulumu', 'CSS/SCSS Düzenleme', 'JS Mantık Kurgusu', 'API Entegrasyonu', 'Responsive Ayarlar', 'Animasyonlar', 'Form Kontrolleri', 'State Yönetimi', 'Performans Opt.', 'Cross-browser Test'],
      'Veritabanı': ['Tablo Yapıları Tasarımı', 'İndeksleme Stratejisi', 'Query Optimizasyonu', 'Yedekleme Planı', 'Stored Proc. Yazımı', 'Data Migration', 'Güvenlik Yetkilendirmeleri', 'Replika Kurulumu', 'Monitoring', 'Dökümantasyon'],
      'Proje Yönetimi': ['Risk Analizi', 'Zaman Çizelgesi', 'Kaynak Planlaması', 'Ekip Toplantısı', 'Bütçe Kontrolü', 'Müşteri Sunumu', 'Kalite Kontrol', 'Süreç İyileştirme', 'Doküman Revizyonu', 'Proje Kapanış'],
      'Mobil Uygulama': ['React Native Kurulum', 'Navigasyon Kurgusu', 'Native Modül Bağlantısı', 'Push Notif. Ayarı', 'App Store Hazırlık', 'Play Store Hazırlık', 'Cihaz Testleri', 'Firebase Bağlantısı', 'Offline Mod', 'Final Build'],
      'Siber Güvenlik': ['Sızma Testi', 'Güvenlik Denetimi', 'SSL Sertifika Kurulumu', 'Firewall Ayarları', 'DDoS Koruması', 'Veri Şifreleme', 'Log Takip Sistemi', 'Zafiyet Taraması', 'Incident Response', 'Final Rapor'],
      'Yazılım': ['Code Review', 'CI/CD Kurulumu', 'Dockerizasyon', 'Refactoring', 'Bug Fixing', 'Technical Debt Analizi', 'Kütüphane Güncelleme', 'Architecture Design', 'Cloud Integration', 'Release Notes']
    };

    // Önce varsayılan proje oluştur (eğer yoksa)
    db.run(
      `INSERT OR IGNORE INTO projects (id, ad, musteri, butce, baslangic, bitis, kategori, durum, ilerleme)
       VALUES (1, 'ProBASE Genel Proje', 'İç Proje', 500000, '2026-01-01', '2026-12-31', 'Yazılım', 'Devam Ediyor', 0)`,
      [],
      () => {
        users.filter(u => u.role === 'personel').forEach(u => {
          const tasks = deptTasks[u.dept] || [];
          tasks.forEach(tName => {
            db.run('INSERT INTO tasks (project_id, baslik, detay, sorumlu_kisi, departman, progress) VALUES (?, ?, ?, ?, ?, ?)',
              [1, tName, `${u.dept} departmanı için standart görev.`, u.name, u.dept, 0]);
          });
        });
        console.log("Seed tamamlandı.");
      }
    );
}

// AUTH
app.post('/api/login', (req, res) => {
  const { email, sifre } = req.body;
  db.get('SELECT * FROM users WHERE email = ?', [email], async (err, user) => {
    if (err) return res.status(500).json({ error: err.message });
    if (!user) return res.status(401).json({ error: 'Kullanıcı bulunamadı.' });
    const match = await bcrypt.compare(sifre, user.sifre);
    if (!match) return res.status(401).json({ error: 'Hatalı şifre.' });
    res.json(user);
  });
});

app.post('/api/register', async (req, res) => {
  const { email, kullaniciAdi, sifre, rol, departman } = req.body;
  if (!email || !kullaniciAdi || !sifre || !rol) {
    return res.status(400).json({ error: 'Tüm alanları doldurun.' });
  }
  // E-posta zaten kayıtlı mı?
  db.get('SELECT id FROM users WHERE email = ?', [email], async (err, existing) => {
    if (err) return res.status(500).json({ error: err.message });
    if (existing) return res.status(409).json({ error: 'Bu e-posta zaten kayıtlı.' });
    const hashed = await bcrypt.hash(sifre, 10);
    db.run(
      'INSERT INTO users (email, sifre, kullaniciAdi, rol, departman, sifre_plain) VALUES (?, ?, ?, ?, ?, ?)',
      [email, hashed, kullaniciAdi, rol, departman || '', sifre],
      function(err) {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ id: this.lastID, message: 'Kayıt başarılı.' });
      }
    );
  });
});

// PROJECTS
app.post('/api/projects', (req, res) => {
  const { ad, musteri, butce, baslangic, bitis, kategori, assigned_personnel } = req.body;
  db.run(`INSERT INTO projects (ad, musteri, butce, baslangic, bitis, kategori, durum) VALUES (?, ?, ?, ?, ?, ?, 'Planlama')`,
    [ad, musteri, butce, baslangic, bitis, kategori], function(err) {
      if (err) return res.status(500).json({ error: err.message });
      const projectId = this.lastID;
      if (assigned_personnel && assigned_personnel.length > 0) {
        assigned_personnel.forEach(name => {
          db.run('INSERT INTO project_assignments (project_id, user_name) VALUES (?, ?)', [projectId, name]);
          db.run('INSERT INTO notifications (user_name, title, message, type) VALUES (?, ?, ?, ?)',
            [name, 'Yeni Proje Atandı', `${ad} projesine dahil edildiniz.`, 'project']);
        });
      }
      res.status(201).json({ id: projectId });
    });
});

app.get('/api/projects', (req, res) => {
  db.all('SELECT * FROM projects', [], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

// TASKS
app.get('/api/tasks', (req, res) => {
  const { user } = req.query;
  if (user) {
    db.all('SELECT * FROM tasks WHERE sorumlu_kisi = ? ORDER BY id DESC', [user], (err, rows) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json(rows);
    });
  } else {
    db.all('SELECT * FROM tasks ORDER BY id DESC', [], (err, rows) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json(rows);
    });
  }
});

app.post('/api/tasks', (req, res) => {
  const { baslik, detay, sorumlu_kisi, departman, deadline, project_id } = req.body;
  if (!baslik || !sorumlu_kisi) return res.status(400).json({ error: 'Görev başlığı ve sorumlu kişi zorunludur.' });

  db.run(
    'INSERT INTO tasks (project_id, baslik, detay, sorumlu_kisi, departman, deadline, progress) VALUES (?, ?, ?, ?, ?, ?, 0)',
    [project_id || 1, baslik, detay || '', sorumlu_kisi, departman || 'Genel', deadline || ''],
    function(err) {
      if (err) return res.status(500).json({ error: err.message });
      // Sorumlu kişiye bildirim gönder
      db.run(
        'INSERT INTO notifications (user_name, title, message, type) VALUES (?, ?, ?, ?)',
        [sorumlu_kisi, 'Yeni Görev Atandı', `Size yeni bir görev atandı: ${baslik}`, 'task']
      );
      res.status(201).json({ id: this.lastID });
    }
  );
});

app.put('/api/tasks/:id', (req, res) => {
  const { progress } = req.body;
  db.get('SELECT * FROM tasks WHERE id = ?', [req.params.id], (err, task) => {
    if (err || !task) return res.status(404).json({ error: 'Task not found' });
    
    db.run('UPDATE tasks SET progress = ? WHERE id = ?', [progress, req.params.id], function(err) {
      if (err) return res.status(500).json({ error: err.message });
      
      // If completed, notify Admin
      if (progress === 100) {
        db.run('INSERT INTO notifications (user_name, title, message, type) VALUES (?, ?, ?, ?)',
          ['Admin User', 'Görev Tamamlandı', `${task.sorumlu_kisi} bir görevi başarıyla bitirdi: ${task.baslik}`, 'task_complete']);
      }

      // Update Project Overall Progress
      db.all('SELECT progress FROM tasks WHERE project_id = ?', [task.project_id], (err, rows) => {
        if (!err && rows.length > 0) {
          const avg = Math.round(rows.reduce((a, b) => a + b.progress, 0) / rows.length);
          db.run('UPDATE projects SET ilerleme = ? WHERE id = ?', [avg, task.project_id]);
        }
      });

      res.json({ success: true });
    });
  });
});

// NOTIFICATIONS
app.get('/api/notifications', (req, res) => {
  const { user } = req.query;
  db.all('SELECT * FROM notifications WHERE user_name = ? ORDER BY timestamp DESC LIMIT 15', [user], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

app.put('/api/notifications/read', (req, res) => {
  const { user } = req.body;
  db.run('UPDATE notifications SET is_read = 1 WHERE user_name = ?', [user], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ success: true });
  });
});

// MESSAGES
app.get('/api/messages', (req, res) => {
  const { sender, receiver } = req.query;
  let sql = 'SELECT * FROM messages WHERE 1=1';
  const params = [];
  if (receiver === 'group') {
    sql += ` AND receiver = 'group'`;
  } else if (sender && receiver) {
    sql += ` AND ((sender = ? COLLATE NOCASE AND receiver = ? COLLATE NOCASE) OR (sender = ? COLLATE NOCASE AND receiver = ? COLLATE NOCASE))`;
    params.push(sender, receiver, receiver, sender);
  } else if (sender) {
    sql += ` AND (sender = ? COLLATE NOCASE OR receiver = ? COLLATE NOCASE OR receiver = 'group')`;
    params.push(sender, sender);
  }
  db.all(sql, params, (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

app.post('/api/messages', (req, res) => {
  const { sender, receiver, text, time, is_ai } = req.body;
  const finalReceiver = receiver || 'group';
  const finalIsAi = is_ai ? 1 : 0;
  
  db.run(`INSERT INTO messages (sender, receiver, text, time, is_ai) VALUES (?, ?, ?, ?, ?)`,
    [sender, finalReceiver, text, time, finalIsAi], function(err) {
      if (err) return res.status(500).json({ error: err.message });
      console.log(`Message debug: Sender=${sender}, Receiver=${finalReceiver}, Text=${text}`);
      const messageId = this.lastID;

      // Handle AI Response if receiver is 'group' (Assistant)
      const isGroup = String(finalReceiver).toLowerCase() === 'group';
      if (isGroup && finalIsAi === 0) {
          setTimeout(() => {
              const lowText = String(text || "").toLowerCase();
              let aiResponse = "Merhaba! Size nasıl yardımcı olabilirim? Projeleriniz veya görevleriniz hakkında soru sorabilirsiniz.";
              
              if(lowText.includes("selam") || lowText.includes("merhaba")) aiResponse = "Merhaba! Harika bir gün dilerim. Nasıl yardımcı olabilirim?";
              else if(lowText.includes("yardım")) aiResponse = "Tabii ki! Proje durumları, görev tamamlama veya sistem kullanımı hakkında bilgi verebilirim.";
              else if(lowText.includes("kimsin")) aiResponse = "Ben ProBASE yönetim asistanıyım. İşlerinizi kolaylaştırmak için buradayım.";
              else if(lowText.includes("proje")) aiResponse = "Projelerinizin detaylarına 'Projelerim' sayfasından ulaşabilirsiniz.";
              else if(lowText.includes("görev")) aiResponse = "Aktif görevlerinizi ana sayfadan takip edip tamamladıkça işaretleyebilirsiniz.";

              const aiTime = new Date().toLocaleTimeString([], {hour:'2-digit', minute:'2-digit'});
              db.run(`INSERT INTO messages (sender, receiver, text, time, is_ai) VALUES (?, ?, ?, ?, ?)`,
                ['proBASE asistan', 'group', aiResponse, aiTime, 1]);
          }, 500);
      }

      if (finalReceiver !== 'group' && finalIsAi === 0) {
        db.run('INSERT INTO notifications (user_name, title, message, type) VALUES (?, ?, ?, ?)',
          [finalReceiver, 'Yeni Mesaj', `${sender} size bir mesaj gönderdi.`, 'message']);
      }
      res.status(201).json({ id: messageId });
    });
});

// CUSTOMERS
app.get('/api/customers', (req, res) => {
  db.all("SELECT id, email, kullaniciAdi, departman, rol, sifre_plain FROM users WHERE rol = 'musteri'", [], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

app.post('/api/customers', async (req, res) => {
  const { sirket, eposta, sifre, sektor } = req.body;
  const hashed = await bcrypt.hash(sifre, 10);
  db.run('INSERT INTO users (email, sifre, kullaniciAdi, rol, departman, sifre_plain) VALUES (?, ?, ?, ?, ?, ?)',
    [eposta, hashed, sirket, 'musteri', sektor, sifre], function(err) {
      if (err) return res.status(500).json({ error: err.message });
      res.status(201).json({ id: this.lastID });
    });
});

app.put('/api/customers/:id', async (req, res) => {
  const { sirket, eposta, sifre, sektor } = req.body;
  let sql = 'UPDATE users SET kullaniciAdi = ?, email = ?, departman = ?';
  let params = [sirket, eposta, sektor];
  
  if (sifre) {
    const hashed = await bcrypt.hash(sifre, 10);
    sql += ', sifre = ?, sifre_plain = ?';
    params.push(hashed, sifre);
  }
  
  sql += ' WHERE id = ?';
  params.push(req.params.id);
  
  db.run(sql, params, function(err) {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ success: true });
  });
});

app.delete('/api/customers/:id', (req, res) => {
  db.run("DELETE FROM users WHERE id = ? AND rol = 'musteri'", [req.params.id], function(err) {
    if (err) return res.status(500).json({ error: err.message });
    if (this.changes === 0) return res.status(404).json({ error: 'Müşteri bulunamadı.' });
    res.json({ success: true });
  });
});

// PERSONNEL & CLIENTS FOR CHAT
app.get('/api/personnel', (req, res) => {
  db.all("SELECT id, kullaniciAdi, email, departman, rol FROM users WHERE rol IN ('personel', 'admin', 'musteri')", [], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

app.get('/api/my-project', (req, res) => {
    const { user } = req.query;
    db.get('SELECT * FROM projects WHERE musteri = ?', [user], (err, row) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(row || {});
    });
});

// REPORTS API
app.get('/api/reports-data/:projectId', (req, res) => {
    const projectId = req.params.projectId;
    
    // Aggregate data for the report
    db.get('SELECT * FROM projects WHERE id = ?', [projectId], (err, project) => {
        if (err || !project) return res.status(404).json({ error: 'Proje bulunamadı' });
        
        db.all('SELECT * FROM tasks WHERE project_id = ?', [projectId], (err, tasks) => {
            if (err) return res.status(500).json({ error: err.message });
            
            db.all('SELECT * FROM project_assignments WHERE project_id = ?', [projectId], (err, assignments) => {
                res.json({
                    project,
                    tasks,
                    assignments
                });
            });
        });
    });
});

app.post('/api/reports', (req, res) => {
    const { project_id, summary } = req.body;
    db.run('INSERT INTO reports (project_id, summary) VALUES (?, ?)', [project_id, summary], function(err) {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ id: this.lastID });
    });
});

app.listen(PORT, () => {
  console.log(`Sunucu aktif: http://localhost:${PORT}`);
});
