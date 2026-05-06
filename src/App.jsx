import './App.css'

function App() {
  const goToGiris = () => {
    window.location.href = '/giriş.html'
  }

  return (
    <main className="giris-sayfasi">
      <section className="giris-karti">
        <div className="logo-blok">
          <div className="probase-logo" aria-hidden="true">
            <svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <linearGradient id="m1" x1="0%" y1="0%" x2="100%" y2="100%">
                  <stop offset="0%" stopColor="#1d4ed8" />
                  <stop offset="100%" stopColor="#2563eb" />
                </linearGradient>
              </defs>
              <rect x="14" y="14" width="92" height="92" rx="24" fill="#f8fbff" />
              <path d="M36 32 H62 C70 32 76 38 76 46 V74 C76 82 70 88 62 88 H36" stroke="url(#m1)" strokeWidth="12" strokeLinecap="round" fill="none" />
              <path d="M42 48 H60 C65 48 70 52 70 58 V58 C70 64 65 68 60 68 H42" stroke="url(#m1)" strokeWidth="12" strokeLinecap="round" fill="none" />
            </svg>
          </div>
          <div className="marka-yazi">
            <div className="marka-baslik">
              <h1>ProBASE</h1>
            </div>
            <p>Proje & Kaynak Yönetimi</p>
          </div>
        </div>

        <div className="butonlar">
          <button type="button" onClick={goToGiris}>
            ADMIN
          </button>
          <button type="button" onClick={goToGiris}>
            PERSONEL
          </button>
          <button type="button" onClick={goToGiris}>
            MÜŞTERİ
          </button>
        </div>
      </section>
    </main>
  )
}

export default App
