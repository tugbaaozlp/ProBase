USE master;
GO
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ProBASE')
BEGIN
  CREATE DATABASE ProBASE;
END
GO
USE ProBASE;
GO

IF OBJECT_ID('users', 'U') IS NOT NULL DROP TABLE users;
CREATE TABLE users (
  [id] INT IDENTITY(1,1) PRIMARY KEY,
  [email] NVARCHAR(MAX),
  [kullaniciAdi] NVARCHAR(MAX),
  [sifre] NVARCHAR(MAX),
  [rol] NVARCHAR(MAX),
  [departman] NVARCHAR(MAX),
  [sifre_plain] NVARCHAR(MAX)
);
GO

IF OBJECT_ID('projects', 'U') IS NOT NULL DROP TABLE projects;
CREATE TABLE projects (
  [id] INT IDENTITY(1,1) PRIMARY KEY,
  [ad] NVARCHAR(MAX),
  [musteri] NVARCHAR(MAX),
  [butce] NVARCHAR(MAX),
  [baslangic] NVARCHAR(MAX),
  [bitis] NVARCHAR(MAX),
  [durum] NVARCHAR(MAX),
  [ilerleme] INT,
  [kategori] NVARCHAR(MAX)
);
GO

IF OBJECT_ID('messages', 'U') IS NOT NULL DROP TABLE messages;
CREATE TABLE messages (
  [id] INT IDENTITY(1,1) PRIMARY KEY,
  [sender] NVARCHAR(MAX),
  [receiver] NVARCHAR(MAX),
  [text] NVARCHAR(MAX),
  [time] NVARCHAR(MAX),
  [is_ai] INT,
  [timestamp] NVARCHAR(MAX)
);
GO

IF OBJECT_ID('tasks', 'U') IS NOT NULL DROP TABLE tasks;
CREATE TABLE tasks (
  [id] INT IDENTITY(1,1) PRIMARY KEY,
  [project_id] INT,
  [baslik] NVARCHAR(MAX),
  [detay] NVARCHAR(MAX),
  [sorumlu_kisi] NVARCHAR(MAX),
  [departman] NVARCHAR(MAX),
  [deadline] NVARCHAR(MAX),
  [progress] INT
);
GO

IF OBJECT_ID('notifications', 'U') IS NOT NULL DROP TABLE notifications;
CREATE TABLE notifications (
  [id] INT IDENTITY(1,1) PRIMARY KEY,
  [user_name] NVARCHAR(MAX),
  [title] NVARCHAR(MAX),
  [message] NVARCHAR(MAX),
  [type] NVARCHAR(MAX),
  [is_read] INT,
  [timestamp] NVARCHAR(MAX)
);
GO

IF OBJECT_ID('personnel', 'U') IS NOT NULL DROP TABLE personnel;
CREATE TABLE personnel (
  [id] INT IDENTITY(1,1) PRIMARY KEY,
  [kullaniciAdi] NVARCHAR(MAX),
  [email] NVARCHAR(MAX),
  [departman] NVARCHAR(MAX),
  [rol] NVARCHAR(MAX)
);
GO

SET IDENTITY_INSERT projects ON;
INSERT INTO projects ([id], [ad], [musteri], [butce], [baslangic], [bitis], [durum], [ilerleme], [kategori]) VALUES (1, 'e-ticaret uygulaması', 'akınlar holding', 500000, '2026-05-01', '2027-10-10', 'Planlama', 38, 'Yazılım');
SET IDENTITY_INSERT projects OFF;
SET IDENTITY_INSERT projects ON;
INSERT INTO projects ([id], [ad], [musteri], [butce], [baslangic], [bitis], [durum], [ilerleme], [kategori]) VALUES (2, 'inşaat tanıtım websitesi', 'akınlar holding', 100000, '2026-05-01', '2027-10-10', 'Planlama', 0, 'Pazarlama');
SET IDENTITY_INSERT projects OFF;
GO

SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (1, 1, 'UI Araştırması', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (2, 1, 'Tipografi Seçimi', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (3, 1, 'Sayfa Tasarımları', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (4, 1, 'Prototip Oluşturma', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (5, 1, 'İkon Seti Hazırlığı', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (6, 1, 'UX Testi', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (7, 1, 'Final Teslimat', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (8, 1, 'DB Şeması Oluşturma', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (9, 1, 'API Rotaları Tasarımı', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (10, 1, 'Auth Sistemi Kurulumu', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (11, 1, 'Wireframe Hazırlığı', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (12, 1, 'Sunucu Yapılandırması', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (13, 1, 'DB Entegrasyonu', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (14, 1, 'Cache Yönetimi', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (15, 1, 'API Dökümantasyonu', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (16, 1, 'Unit Testler', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (17, 1, 'Deployment', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (18, 1, 'HTML Yapısı Kurulumu', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (19, 1, 'CSS/SCSS Düzenleme', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (20, 1, 'JS Mantık Kurgusu', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (21, 1, 'API Entegrasyonu', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (22, 1, 'Responsive Ayarlar', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (23, 1, 'Animasyonlar', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (24, 1, 'Form Kontrolleri', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (25, 1, 'State Yönetimi', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (26, 1, 'Performans Opt.', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (27, 1, 'Cross-browser Test', 'Frontend departmanı için zorunlu görev.', 'Tuğçe Aydın', 'Frontend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (28, 1, 'Tablo Yapıları Tasarımı', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (29, 1, 'İndeksleme Stratejisi', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (30, 1, 'Query Optimizasyonu', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (31, 1, 'Yedekleme Planı', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (32, 1, 'Stored Proc. Yazımı', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (33, 1, 'Data Migration', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (34, 1, 'Güvenlik Yetkilendirmeleri', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (35, 1, 'Replika Kurulumu', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (36, 1, 'Monitoring', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (37, 1, 'Dökümantasyon', 'Veritabanı departmanı için zorunlu görev.', 'Sema Kanca', 'Veritabanı', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (38, 1, 'Risk Analizi', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (39, 1, 'Zaman Çizelgesi', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (40, 1, 'Kaynak Planlaması', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (41, 1, 'Ekip Toplantısı', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (42, 1, 'Bütçe Kontrolü', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (43, 1, 'Müşteri Sunumu', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (44, 1, 'Kalite Kontrol', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (45, 1, 'Süreç İyileştirme', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (46, 1, 'Doküman Revizyonu', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (47, 1, 'Proje Kapanış', 'Proje Yönetimi departmanı için zorunlu görev.', 'Zübeyde Kaya', 'Proje Yönetimi', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (48, 1, 'Native Modül Bağlantısı', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (49, 1, 'Push Notif. Ayarı', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (50, 1, 'App Store Hazırlık', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (51, 1, 'Play Store Hazırlık', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (52, 1, 'Navigasyon Kurgusu', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (53, 1, 'Cihaz Testleri', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (54, 1, 'Firebase Bağlantısı', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (55, 1, 'Offline Mod', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (56, 1, 'Final Build', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (57, 1, 'Sızma Testi', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (58, 1, 'Güvenlik Denetimi', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (59, 1, 'DDoS Koruması', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (60, 1, 'React Native Kurulum', 'Mobil Uygulama departmanı için zorunlu görev.', 'Fatmanur Yılmaz', 'Mobil Uygulama', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (61, 1, 'Veri Şifreleme', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (62, 1, 'Log Takip Sistemi', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (63, 1, 'Zafiyet Taraması', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (64, 1, 'SSL Sertifika Kurulumu', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (65, 1, 'Firewall Ayarları', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (66, 1, 'Final Rapor', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (67, 1, 'Incident Response', 'Siber Güvenlik departmanı için zorunlu görev.', 'Ömer Faruk', 'Siber Güvenlik', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (68, 1, 'Code Review', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (69, 1, 'CI/CD Kurulumu', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (70, 1, 'Dockerizasyon', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (71, 1, 'Refactoring', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (72, 1, 'Bug Fixing', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (73, 1, 'Technical Debt Analizi', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (74, 1, 'Kütüphane Güncelleme', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (75, 1, 'Architecture Design', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (76, 1, 'Cloud Integration', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (77, 1, 'Release Notes', 'Yazılım departmanı için zorunlu görev.', 'Yeni Personel', 'Yazılım', NULL, 0);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (78, 1, 'Veri Validasyonu', 'Backend departmanı için zorunlu görev.', 'Ali Yılmaz', 'Backend', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (79, 1, 'Logo Tasarımı', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
SET IDENTITY_INSERT tasks ON;
INSERT INTO tasks ([id], [project_id], [baslik], [detay], [sorumlu_kisi], [departman], [deadline], [progress]) VALUES (80, 1, 'Renk Paleti Seçimi', 'Tasarım departmanı için zorunlu görev.', 'Kevser Demir', 'Tasarım', NULL, 100);
SET IDENTITY_INSERT tasks OFF;
GO

GO

SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (1, 'Tuğçe Aydın', 'Yeni Proje Atandı', 'e-ticaret uygulaması projesine dahil edildiniz.', 'project', 0, '2026-05-06 12:40:27');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (2, 'Sema Kanca', 'Yeni Proje Atandı', 'e-ticaret uygulaması projesine dahil edildiniz.', 'project', 0, '2026-05-06 12:40:27');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (3, 'Zübeyde Kaya', 'Yeni Proje Atandı', 'e-ticaret uygulaması projesine dahil edildiniz.', 'project', 0, '2026-05-06 12:40:27');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (4, 'Fatmanur Yılmaz', 'Yeni Proje Atandı', 'e-ticaret uygulaması projesine dahil edildiniz.', 'project', 0, '2026-05-06 12:40:27');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (5, 'Ömer Faruk', 'Yeni Proje Atandı', 'e-ticaret uygulaması projesine dahil edildiniz.', 'project', 0, '2026-05-06 12:40:27');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (6, 'Ali Yılmaz', 'Yeni Proje Atandı', 'e-ticaret uygulaması projesine dahil edildiniz.', 'project', 1, '2026-05-06 12:40:27');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (7, 'Kevser Demir', 'Yeni Proje Atandı', 'e-ticaret uygulaması projesine dahil edildiniz.', 'project', 0, '2026-05-06 12:40:27');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (8, 'Kevser Demir', 'Yeni Mesaj', 'Admin User size bir mesaj gönderdi.', 'message', 0, '2026-05-06 12:41:49');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (9, 'Admin User', 'Yeni Mesaj', 'Kevser Demir size bir mesaj gönderdi.', 'message', 0, '2026-05-06 12:42:38');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (10, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Sayfa Tasarımları', 'task_complete', 0, '2026-05-06 12:58:28');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (11, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: UI Araştırması', 'task_complete', 0, '2026-05-06 12:58:30');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (12, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Wireframe Hazırlığı', 'task_complete', 0, '2026-05-06 12:58:30');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (13, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Prototip Oluşturma', 'task_complete', 0, '2026-05-06 12:58:33');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (14, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: İkon Seti Hazırlığı', 'task_complete', 0, '2026-05-06 12:58:34');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (15, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Final Teslimat', 'task_complete', 0, '2026-05-06 12:58:37');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (16, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: UX Testi', 'task_complete', 0, '2026-05-06 12:58:38');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (17, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Tipografi Seçimi', 'task_complete', 0, '2026-05-06 12:58:40');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (18, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Renk Paleti Seçimi', 'task_complete', 0, '2026-05-06 12:58:41');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (19, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Logo Tasarımı', 'task_complete', 0, '2026-05-06 12:58:42');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (20, 'Admin User', 'Yeni Mesaj', 'holduroğlu size bir mesaj gönderdi.', 'message', 0, '2026-05-06 13:17:59');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (21, 'holduroğlu', 'Yeni Mesaj', 'Admin User size bir mesaj gönderdi.', 'message', 0, '2026-05-06 13:23:59');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (22, 'Admin User', 'Yeni Mesaj', 'holduroğlu size bir mesaj gönderdi.', 'message', 0, '2026-05-06 13:26:32');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (23, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: UI Araştırması', 'task_complete', 0, '2026-05-06 13:28:41');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (24, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Tipografi Seçimi', 'task_complete', 0, '2026-05-06 13:28:42');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (25, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Sayfa Tasarımları', 'task_complete', 0, '2026-05-06 13:28:43');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (26, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Prototip Oluşturma', 'task_complete', 0, '2026-05-06 13:28:44');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (27, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: İkon Seti Hazırlığı', 'task_complete', 0, '2026-05-06 13:28:44');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (28, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: UX Testi', 'task_complete', 0, '2026-05-06 13:29:47');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (29, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Final Teslimat', 'task_complete', 0, '2026-05-06 13:29:48');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (30, 'Ali Yılmaz', 'Yeni Mesaj', 'Kevser Demir size bir mesaj gönderdi.', 'message', 1, '2026-05-06 13:30:02');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (31, 'akın holding', 'Yeni Mesaj', 'Admin User size bir mesaj gönderdi.', 'message', 0, '2026-05-06 14:10:00');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (32, 'Tuğçe Aydın', 'Yeni Proje Atandı', 'inşaat tanıtım websitesi projesine dahil edildiniz.', 'project', 0, '2026-05-06 14:12:08');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (33, 'Sema Kanca', 'Yeni Proje Atandı', 'inşaat tanıtım websitesi projesine dahil edildiniz.', 'project', 0, '2026-05-06 14:12:08');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (34, 'Zübeyde Kaya', 'Yeni Proje Atandı', 'inşaat tanıtım websitesi projesine dahil edildiniz.', 'project', 0, '2026-05-06 14:12:08');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (35, 'Fatmanur Yılmaz', 'Yeni Proje Atandı', 'inşaat tanıtım websitesi projesine dahil edildiniz.', 'project', 0, '2026-05-06 14:12:08');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (36, 'Kevser Demir', 'Yeni Proje Atandı', 'inşaat tanıtım websitesi projesine dahil edildiniz.', 'project', 0, '2026-05-06 14:12:08');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (37, 'Ali Yılmaz', 'Yeni Proje Atandı', 'inşaat tanıtım websitesi projesine dahil edildiniz.', 'project', 0, '2026-05-06 14:12:08');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (38, 'Kevser Demir', 'Yeni Mesaj', 'Admin User size bir mesaj gönderdi.', 'message', 0, '2026-05-06 14:14:59');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (39, 'Sema Kanca', 'Yeni Mesaj', 'Admin User size bir mesaj gönderdi.', 'message', 0, '2026-05-06 14:15:07');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (40, 'Ali Yılmaz', 'Yeni Mesaj', 'Kevser Demir size bir mesaj gönderdi.', 'message', 0, '2026-05-06 14:17:52');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (41, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Wireframe Hazırlığı', 'task_complete', 0, '2026-05-06 14:17:59');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (42, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Logo Tasarımı', 'task_complete', 0, '2026-05-06 14:18:00');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (43, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Renk Paleti Seçimi', 'task_complete', 0, '2026-05-06 14:18:05');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (44, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: DB Şeması Oluşturma', 'task_complete', 0, '2026-05-06 14:18:24');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (45, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: API Rotaları Tasarımı', 'task_complete', 0, '2026-05-06 14:18:26');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (46, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: Auth Sistemi Kurulumu', 'task_complete', 0, '2026-05-06 14:19:08');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (47, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: Sunucu Yapılandırması', 'task_complete', 0, '2026-05-06 14:19:09');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (48, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: Cache Yönetimi', 'task_complete', 0, '2026-05-06 14:19:10');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (49, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: DB Entegrasyonu', 'task_complete', 0, '2026-05-06 14:19:11');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (50, 'Admin User', 'Yeni Mesaj', 'akın holding size bir mesaj gönderdi.', 'message', 0, '2026-05-06 14:21:11');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (51, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: Prototip Oluşturma', 'task_complete', 0, '2026-05-06 14:31:47');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (52, 'Admin User', 'Görev Tamamlandı', 'Kevser Demir bir görevi başarıyla bitirdi: İkon Seti Hazırlığı', 'task_complete', 0, '2026-05-06 14:31:48');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (53, 'bekir', 'Yeni Mesaj', 'Admin User size bir mesaj gönderdi.', 'message', 0, '2026-05-06 14:39:23');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (54, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: API Dökümantasyonu', 'task_complete', 0, '2026-05-06 14:43:47');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (55, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: Unit Testler', 'task_complete', 0, '2026-05-06 14:43:49');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (56, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: Deployment', 'task_complete', 0, '2026-05-06 14:43:49');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (57, 'Admin User', 'Görev Tamamlandı', 'Ali Yılmaz bir görevi başarıyla bitirdi: Veri Validasyonu', 'task_complete', 0, '2026-05-06 14:43:50');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (58, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: HTML Yapısı Kurulumu', 'task_complete', 0, '2026-05-06 14:44:39');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (59, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: JS Mantık Kurgusu', 'task_complete', 0, '2026-05-06 14:44:40');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (60, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: CSS/SCSS Düzenleme', 'task_complete', 0, '2026-05-06 14:44:42');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (61, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: API Entegrasyonu', 'task_complete', 0, '2026-05-06 14:44:42');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (62, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: Responsive Ayarlar', 'task_complete', 0, '2026-05-06 14:44:43');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (63, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: Animasyonlar', 'task_complete', 0, '2026-05-06 14:44:44');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (64, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: Form Kontrolleri', 'task_complete', 0, '2026-05-06 14:44:45');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (65, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: State Yönetimi', 'task_complete', 0, '2026-05-06 14:44:46');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (66, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: Performans Opt.', 'task_complete', 0, '2026-05-06 14:44:46');
SET IDENTITY_INSERT notifications OFF;
SET IDENTITY_INSERT notifications ON;
INSERT INTO notifications ([id], [user_name], [title], [message], [type], [is_read], [timestamp]) VALUES (67, 'Admin User', 'Görev Tamamlandı', 'Tuğçe Aydın bir görevi başarıyla bitirdi: Cross-browser Test', 'task_complete', 0, '2026-05-06 14:44:48');
SET IDENTITY_INSERT notifications OFF;
GO

SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (88, 'adminuser@probase.com', 'Admin User', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'admin', 'Yönetici', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (89, 'aliyilmaz@probase.com', 'Ali Yılmaz', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Backend', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (90, 'zubeydekaya@probase.com', 'Zübeyde Kaya', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Proje Yönetimi', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (91, 'yenipersonel@probase.com', 'Yeni Personel', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Yazılım', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (92, 'fatmanuryilmaz@probase.com', 'Fatmanur Yılmaz', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Mobil Uygulama', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (93, 'omerfaruk@probase.com', 'Ömer Faruk', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Siber Güvenlik', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (94, 'tugceaydin@probase.com', 'Tuğçe Aydın', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Frontend', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (95, 'semakanca@probase.com', 'Sema Kanca', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Veritabanı', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (96, 'kevserdemir@probase.com', 'Kevser Demir', '$2b$10$g2o3vM/VRJSqkXMMBmtIG.IyUvNZm3fRcxN6If1olxtDU4tNMtYv2', 'personel', 'Tasarım', NULL);
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (97, 'holduroglu@resmi.com', 'holduroğlu', '$2b$10$DEOMs5xl8Qs0YI9VgstZ1us0hBr3YM4qWGc1c7/JRghAgbwbApBN6', 'musteri', 'inşaat', '12345678');
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (98, 'akinholding@resmi.com', 'akın holding', '$2b$10$6nrnYrbq3SOiN7ZDoFEb/urllGF7F8M0uunrT1XYqK304PE4Wo2Nm', 'musteri', 'inşaat', '123456789');
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (99, 'pvc@resmi.com', 'ahmet', '$2b$10$2TChQYFITRVtNz7iRbSBF.NXlp78v3EnnA3Ubw5MeYxUzArPhb89m', 'musteri', 'pencere', '123456789');
SET IDENTITY_INSERT users OFF;
SET IDENTITY_INSERT users ON;
INSERT INTO users ([id], [email], [kullaniciAdi], [sifre], [rol], [departman], [sifre_plain]) VALUES (100, 'özpen@resmi.com', 'bekir', '$2b$10$8RyDLULiKqiQFkm9hKB8CuccEgZL2Q0ZvYRU0L4fzWFlzv.4rDPjq', 'musteri', 'pvc', '123456789');
SET IDENTITY_INSERT users OFF;
GO

SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (1, 'Admin User', 'Kevser Demir', 'kevser merhaba nasılsın figma tasarımına başladın mı acaba?', '15:41', 0, '2026-05-06 12:41:49');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (2, 'Kevser Demir', 'Admin User', 'evet başladım admin en yakın zamanda tamamlayıp sana ileteceğim.', '15:42', 0, '2026-05-06 12:42:38');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (3, 'holduroğlu', 'Admin User', 'merhaba tugba hanım proje durumumu göremiyorum. yardımcı olur musunuz?', '16:17', 0, '2026-05-06 13:17:59');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (4, 'Admin User', 'holduroğlu', 'merhaba fatih bey hemen kontrol sağlıyorum teknik ekibimle', '16:23', 0, '2026-05-06 13:23:59');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (5, 'holduroğlu', 'Admin User', 'teşekkürler sorun giderilmiş.', '16:26', 0, '2026-05-06 13:26:32');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (6, 'Kevser Demir', 'Ali Yılmaz', 'merhaba ali ben figma tasarımını bitirdim', '16:30', 0, '2026-05-06 13:30:02');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (7, 'Admin User', 'akın holding', 'merhaba akın bey proje bütçesi hakkında bir toplantı yapabilir miyiz ?', '17:10', 0, '2026-05-06 14:10:00');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (8, 'Admin User', 'Kevser Demir', 'tasarımın  güncellenmesi ile ilgili sana bir görev atadım onu incele lütfen', '17:14', 0, '2026-05-06 14:14:59');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (9, 'Admin User', 'Sema Kanca', 'selam', '17:15', 0, '2026-05-06 14:15:07');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (10, 'Kevser Demir', 'Ali Yılmaz', 'ali figma tasarımı bitti frontende başlayabilrisin', '17:17', 0, '2026-05-06 14:17:52');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (11, 'akın holding', 'Admin User', 'tabi ki tugba hanım hemen meet linki paylaşkın ve toplanalım', '17:21', 0, '2026-05-06 14:21:11');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (12, 'Kevser Demir', 'group', 'selam', '17:21', 0, '2026-05-06 14:21:53');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (13, 'Kevser Demir', 'group', 'chat', '17:24', 0, '2026-05-06 14:24:41');
SET IDENTITY_INSERT messages OFF;
SET IDENTITY_INSERT messages ON;
INSERT INTO messages ([id], [sender], [receiver], [text], [time], [is_ai], [timestamp]) VALUES (14, 'Admin User', 'bekir', 'Bekir bey acilen toplantı yapmalıyız', '17:39', 0, '2026-05-06 14:39:23');
SET IDENTITY_INSERT messages OFF;
GO

