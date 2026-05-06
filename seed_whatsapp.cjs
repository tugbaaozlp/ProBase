const sqlite3 = require('sqlite3').verbose();
const bcrypt = require('bcrypt');
const db = new sqlite3.Database('./probase.db');

const users = [
  { name: 'Zeynep Alaca', dept: 'Frontend', email: 'zeynep.alaca@probase.com' },
  { name: 'Ahmet Sönmez', dept: 'Backend', email: 'ahmet.sonmez@probase.com' },
  { name: 'Mert Demir', dept: 'Tasarım', email: 'mert.demir@probase.com' },
  { name: 'Selin Yılmaz', dept: 'Mobil Uygulama', email: 'selin.yilmaz@probase.com' }
];

async function seed() {
  const password = await bcrypt.hash('12345678', 10);
  
  db.serialize(() => {
    users.forEach(u => {
      db.run(`INSERT OR IGNORE INTO users (email, kullaniciAdi, sifre, rol, departman) VALUES (?, ?, ?, 'personel', ?)`, 
        [u.email, u.name, password, u.dept], (err) => {
          if (err) console.error(err);
          else console.log(`${u.name} eklendi.`);
        });
    });
  });
}

seed();
