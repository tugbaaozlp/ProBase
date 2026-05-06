const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');
const db = new sqlite3.Database('probase.db');

let sql = `USE master;
GO
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ProBASE')
BEGIN
  CREATE DATABASE ProBASE;
END
GO
USE ProBASE;
GO

`;

const tables = ['users', 'projects', 'tasks', 'messages', 'notifications', 'personnel'];
let count = 0;

tables.forEach(table => {
    db.all(`PRAGMA table_info(${table})`, [], (err, info) => {
        if (err) {
            console.error(err);
            return;
        }

        sql += `IF OBJECT_ID('${table}', 'U') IS NOT NULL DROP TABLE ${table};\n`;
        sql += `CREATE TABLE ${table} (\n`;
        info.forEach((col, i) => {
            let type = col.type === 'INTEGER' ? 'INT' : 'NVARCHAR(MAX)';
            if (col.pk) type += ' IDENTITY(1,1) PRIMARY KEY';
            sql += `  [${col.name}] ${type}${i < info.length - 1 ? ',' : ''}\n`;
        });
        sql += `);\nGO\n\n`;

        db.all(`SELECT * FROM ${table}`, [], (err, rows) => {
            rows.forEach(row => {
                const keys = Object.keys(row).map(k => `[${k}]`).join(', ');
                const vals = Object.values(row).map(v => {
                    if (v === null) return 'NULL';
                    if (typeof v === 'string') return "'" + v.replace(/'/g, "''") + "'";
                    return v;
                }).join(', ');

                sql += `SET IDENTITY_INSERT ${table} ON;\n`;
                sql += `INSERT INTO ${table} (${keys}) VALUES (${vals});\n`;
                sql += `SET IDENTITY_INSERT ${table} OFF;\n`;
            });
            sql += `GO\n\n`;

            count++;
            if (count === tables.length) {
                fs.writeFileSync('probase_mssql_setup.sql', sql);
                console.log('probase_mssql_setup.sql created successfully');
                db.close();
            }
        });
    });
});
