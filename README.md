# 🕵️‍♂️ HITMAN: World of Assassination — Mod Subtitle & UI Bahasa Indonesia

[![Game](https://img.shields.io/badge/Game-HITMAN_World_of_Assassination-red.svg)](https://store.steampowered.com/app/1659040/HITMAN_World_of_Assassination/)
[![Platform](https://img.shields.io/badge/Platform-PC_(Steam_&_Epic)-blue.svg)]()
[![Language](https://img.shields.io/badge/Language-Bahasa_Indonesia-brightgreen.svg)]()
[![Mod_Type](https://img.shields.io/badge/Mod-RPKG_Native_Patch-orange.svg)]()

Mod lokalisasi lengkap untuk **HITMAN: World of Assassination (HITMAN 3)** di PC yang mengubah teks dialog percakapan, cutscene sinematik, briefing Diana Burnwood, dan antarmuka/menu utama ke dalam **Bahasa Indonesia**.

Dibuat menggunakan format patch resmi engine (*Glacier 2 Engine*) sehingga **tidak memerlukan mod loader tambahan**, tidak perlu aplikasi pihak ketiga yang memberatkan, dan aman untuk game original di Steam maupun Epic Games.

---

## ✨ Fitur & Cakupan Mod

* **1.253 File Dialog Cerita & Subtitel (DLGE):**
  * Seluruh briefing misi dari Diana Burnwood.
  * Dialog sinematik & percakapan cutscene cerita utama.
  * Percakapan *in-game* antar NPC, target misi, percakapan rahasia/pelindung, dan pengumuman interkom.
  * Sinkronisasi timing audio dan teks tetap presisi 100% menggunakan format timestamp bawaan engine.
* **Antarmuka & Menu Utama (LOCR):**
  * Navigasi Menu Utama (*Play, Destinations, Career, Options*).
  * HUD, petunjuk interaksi tombol (*Action Prompts*), dan notifikasi misi.
  * Tutorial dasar (*The Facility*).
* **Ringan & Aman:** File patch hanya berukuran ~3 MB dan otomatis membuat backup file asli game saat dipasang.

---

## 🚀 Cara Pemasangan (Paling Gampang)

Kamu punya dua opsi cara pasang, cukup pilih yang paling nyaman:

### Opsi A: 1-Click Otomatis (Direkomendasikan)
1. Unduh repositori ini (Klik tombol hijau **Code** ➔ **Download ZIP** lalu ekstrak).
2. Buka folder hasil ekstrak, lalu klik dua kali file **`Install_Sub_Indo.bat`**.
3. Installer akan otomatis mendeteksi folder game HITMAN kamu (Steam atau Epic Games), membuat backup file asli, dan memasang patch.
4. Muncul tulisan **PEMASANGAN MOD SELESAI & BERHASIL!**.

---

### Opsi B: Pemasangan Manual (Copy-Paste)
Jika game kamu terpasang di folder custom:
1. Buka folder instalasi game kamu, lalu masuk ke folder **`Runtime`**.
   * Contoh Steam: `C:\Program Files (x86)\Steam\steamapps\common\HITMAN 3\Runtime`
   * Contoh Epic: `C:\Program Files\Epic Games\HITMAN3\Runtime`
2. Di dalam folder `Runtime`, cari file `packagedefinition.txt`, lalu copy dan beri nama cadangan **`packagedefinition.txt.bak`** *(untuk jaga-jaga/backup)*.
3. Buka folder **`mod_files`** dari repositori ini, lalu copy 2 file berikut:
   * `chunk0patch5.rpkg`
   * `packagedefinition.txt`
4. Paste dan **Replace / Timpa** ke dalam folder **`Runtime`** game kamu. Selesai!

---

## 🎮 Pengaturan Wajib di Dalam Game

Agar subtitle Bahasa Indonesia langsung muncul saat bermain:

1. Jalankan **HITMAN World of Assassination** dari Steam / Epic Games seperti biasa.
2. Di dalam pengaturan game:
   * **Language / Bahasa:** Pastikan tetap diatur ke **English** *(karena mod ini menimpa jalur teks bahasa Inggris)*.
   * Masuk ke **Options** ➔ **Gameplay / Audio** ➔ pastikan opsi **Subtitles** diatur ke **ON**.
3. Nikmati petualangan Agent 47 dengan subtitle Bahasa Indonesia!

---

## 🔄 Cara Menghapus Mod (Uninstall)

Jika kamu ingin mengembalikan game ke Bahasa Inggris asli developer kapan saja:
* Cukup klik dua kali file **`Uninstall_Sub_Indo.bat`**, atau:
* Hapus file `chunk0patch5.rpkg` di folder `Runtime`, lalu kembalikan nama `packagedefinition.txt.bak` menjadi `packagedefinition.txt`.

---

## 🛠️ Kredit & Perangkat
* Dibuat menggunakan **[RPKG-Tool](https://github.com/glacier-modding/RPKG-Tool)** oleh komunitas modding Glacier Engine.
* Dikembangkan untuk komunitas gamer PC Indonesia.
