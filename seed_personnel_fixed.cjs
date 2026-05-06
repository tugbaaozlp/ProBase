const sqlite3 = require('sqlite3').verbose();
const bcrypt = require('bcrypt');
const db = new sqlite3.Database('./probase.db');

const users = [
  { name: 'Tuğçe Aydın', dept: 'Frontend' },
  { name: 'Ali Yılmaz', dept: 'Backend' },
  { name: 'Kevser Demir', dept: 'Tasarım' },
  { name: 'Sema Kanca', dept: 'Veritabanı' },
  { name: 'Zübeyde Kaya', dept: 'Proje Yönetimi' }
];

async function seed() {
  const password = await bcrypt.hash('123', 10);
  
  db.serialize(() => {
    users.forEach(u => {
      db.run(`INSERT OR IGNORE INTO users (email, kullaniciAdi, sifre, rol, departman) VALUES (?, ?, ?, 'personel', ?)`, 
        [`${u.name.toLowerCase().replace(' ', '.')}@probase.com`, u.name, password, u.dept], (err) => {
          if (err) console.error(err);
          else console.log(`${u.name} eklendi.`);
        });
    });
  });
}

seed();
