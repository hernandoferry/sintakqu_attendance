# Sintakqu Attendance - Folder Structure `lib/`

Folder structure ini menggunakan pendekatan **Feature-First Architecture** (Arsitektur berbasis Fitur). Struktur ini sangat ramah untuk pemula karena mengelompokkan kode berdasarkan fungsi bisnisnya (misalnya, semua hal tentang `auth` berada dalam satu folder), namun juga sangat scalable dan mudah dipelihara (maintain) seiring berkembangnya aplikasi.

## Visualisasi Struktur Folder

```text
lib/
├── core/                        # Komponen global, konfigurasi, dan helper yang digunakan di seluruh aplikasi
│   ├── constants/               # Variabel konstan (API endpoints, warna, ukuran, dll.)
│   │   ├── api_endpoints.dart   # URL API Laravel
│   │   └── app_colors.dart      # Kode warna tema aplikasi
│   ├── network/                 # Pengaturan koneksi API (HTTP/Dio Client)
│   │   └── dio_client.dart      # Konfigurasi Dio & Interceptor (auto-inject Bearer Token)
│   ├── theme/                   # Pengaturan gaya dan tema (Light & Dark Theme)
│   ├── utils/                   # Helper utilities (Format tanggal, Geolocation, dll.)
│   │   └── location_helper.dart # Helper Geolocator untuk presensi radius
│   └── widgets/                 # Reusable widget global (Custom Button, Input Field, Loading, dll.)
│
├── features/                    # Berisi fitur-fitur aplikasi (Modular)
│   ├── auth/                    # Fitur Autentikasi (Login, Register, Logout)
│   │   ├── data/                # Lapisan Data: Model dan API Service khusus Auth
│   │   │   ├── models/          # Model data (UserModel, LoginRequest)
│   │   │   └── services/        # Service API Retrofit (AuthApiService)
│   │   └── presentation/        # Lapisan UI: Halaman/Screen dan State Controller
│   │       ├── screens/         # Tampilan Halaman (LoginScreen)
│   │       └── widgets/         # Widget kecil khusus halaman Auth
│   │
│   ├── attendance/              # Fitur Presensi Kehadiran (Check-In, Check-Out, History)
│   │   ├── data/
│   │   │   ├── models/          # Model data (AttendanceModel)
│   │   │   └── services/        # Service API Retrofit (AttendanceApiService)
│   │   └── presentation/
│   │       ├── screens/         # Tampilan Halaman (AttendanceScreen)
│   │       └── widgets/
│   │
│   └── profile/                 # Fitur Informasi Profil Pengguna
│       ├── data/
│       └── presentation/
│
└── main.dart                    # Entry point aplikasi Flutter
```

---

## Penjelasan Lapisan (Layers) dalam Fitur

Setiap folder di dalam `features/` dibagi menjadi sub-folder berikut:

1. **`data/`**
   * **`models/`**: Representasi data JSON dari API Laravel ke objek Dart. Di sini kita menggunakan `json_serializable` agar konversi `fromJson` dan `toJson` dibuat otomatis melalui `build_runner`.
   * **`services/`**: Berisi interface pemanggilan API ke Laravel menggunakan `retrofit`. Kode HTTP request-nya akan di-generate otomatis.

2. **`presentation/`**
   * **`screens/`**: Berisi halaman penuh (seperti `LoginScreen`, `AttendanceScreen`).
   * **`widgets/`**: Widget khusus yang hanya dipakai di fitur tersebut untuk menjaga agar file screen tidak terlalu panjang dan tetap bersih.
   * **`controllers/`** *(Opsional)*: Jika Anda menambahkan State Management (seperti BLoC, Cubit, Provider, atau GetX), taruh file logic/state-nya di sub-folder ini.

---

## Langkah Setelah Membuat Folder Structure

1. **Generate File g.dart (Retrofit & JSON)**
   Karena project ini menggunakan `retrofit` dan `json_serializable`, jalankan perintah berikut di terminal Anda untuk meng-generate file parsing JSON dan HTTP request:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. **Mengubah Entrypoint di `main.dart`**
   Ubah parameter `home` di `main.dart` untuk mengarah ke `LoginScreen()` atau `AttendanceScreen()` yang sudah dibuat.
