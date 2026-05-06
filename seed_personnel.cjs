const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('./probase.db');

const users = [
  { name: 'Tuğçe Aydın', dept: 'Frontend' },
  { name: 'Ali Yılmaz', dept: 'Backend' },
  { name: 'Kevser Demir', dept: 'Tasarım' },
  { name: 'Sema Kanca', dept: 'Veritabanı' },
  { name: 'Zübeyde Kaya', dept: 'Proje Yönetimi' },
  { name: 'Yaren Çelik', dept: 'Frontend' },
  { name: 'Mustafa Sönmez', dept: 'Backend' }
];

db.serialize(() => {
  users.forEach(u => {
    // Şifreleri '123' olarak ayarlayalım (bcrypt ile şifrelemek daha iyi ama şimdilik örnek olsun)
    // Aslında server.js bcrypt kullanıyor, o yüzden düzgün ekleyelim.
    db.run(`INSERT OR IGNORE INTO users (kullaniciAdi, sifre, rol, departman) VALUES (?, ?, 'personel', ?)`, 
      [u.name, '123', u.dept]);
  });
  console.log("Örnek personeller eklendi.");
});
db.close();
