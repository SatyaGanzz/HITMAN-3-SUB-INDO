@echo off
setlocal enabledelayedexpansion
title Installer Subtitle Bahasa Indonesia - HITMAN World of Assassination
color 0B

echo ======================================================================
echo    HITMAN: World of Assassination - Mod Subtitle & UI Bahasa Indonesia
echo ======================================================================
echo.

set "SCRIPT_DIR=%~dp0"
set "MOD_RPKG0=%SCRIPT_DIR%mod_files\chunk0patch5.rpkg"
set "MOD_RPKG14=%SCRIPT_DIR%mod_files\chunk14patch5.rpkg"
set "MOD_PKGDEF=%SCRIPT_DIR%mod_files\packagedefinition.txt"

if not exist "%MOD_RPKG0%" (
    echo [ERROR] File mod_files\chunk0patch5.rpkg tidak ditemukan!
    echo Pastikan folder mod_files tidak terhapus atau dipindahkan.
    pause
    exit /b 1
)

echo [1/3] Mendeteksi lokasi instalasi HITMAN 3 / World of Assassination...
set "HITMAN_PATH="

:: 1. Cek Steam Default
if exist "C:\Program Files (x86)\Steam\steamapps\common\HITMAN 3\Runtime" (
    set "HITMAN_PATH=C:\Program Files (x86)\Steam\steamapps\common\HITMAN 3"
)

:: 2. Cek Steam Drive D
if not defined HITMAN_PATH (
    if exist "D:\SteamLibrary\steamapps\common\HITMAN 3\Runtime" (
        set "HITMAN_PATH=D:\SteamLibrary\steamapps\common\HITMAN 3"
    )
)

:: 3. Cek Steam Drive E
if not defined HITMAN_PATH (
    if exist "E:\SteamLibrary\steamapps\common\HITMAN 3\Runtime" (
        set "HITMAN_PATH=E:\SteamLibrary\steamapps\common\HITMAN 3"
    )
)

:: 4. Cek Epic Games Default
if not defined HITMAN_PATH (
    if exist "C:\Program Files\Epic Games\HITMAN3\Runtime" (
        set "HITMAN_PATH=C:\Program Files\Epic Games\HITMAN3"
    )
)

:: 5. Jika tidak ditemukan otomatis, minta input user
if not defined HITMAN_PATH (
    echo.
    echo Game tidak ditemukan di folder standar Steam / Epic Games.
    echo Silakan masukkan / drag-and-drop folder direktori HITMAN 3 kamu:
    echo Contoh: D:\Games\HITMAN 3
    set /p "HITMAN_PATH=Path: "
    set "HITMAN_PATH=!HITMAN_PATH:"=!"
)

if not exist "!HITMAN_PATH!\Runtime" (
    echo.
    echo [ERROR] Folder Runtime tidak ditemukan di "!HITMAN_PATH!".
    echo Pastikan kamu memilih folder utama game HITMAN 3.
    pause
    exit /b 1
)

echo.
echo Direktori game ditemukan: "!HITMAN_PATH!"
echo.

:: Cek apakah user menggunakan Simple Mod Framework (SMF)
if exist "!HITMAN_PATH!\Simple Mod Framework" (
    echo ======================================================================
    echo [DETEKSI SMF] Game kamu menggunakan Simple Mod Framework (SMF)!
    echo Mod akan dipasang langsung ke dalam sistem Simple Mod Framework.
    echo ======================================================================
    echo.
    echo [2/3] Menyalin file mod ke Simple Mod Framework\Mods...
    
    if not exist "!HITMAN_PATH!\Simple Mod Framework\Mods\HITMAN 3 Sub Indo\chunk0" (
        mkdir "!HITMAN_PATH!\Simple Mod Framework\Mods\HITMAN 3 Sub Indo\chunk0" >nul 2>&1
    )
    copy /Y "%MOD_RPKG0%" "!HITMAN_PATH!\Simple Mod Framework\Mods\HITMAN 3 Sub Indo\chunk0\sub_indo.rpkg" >nul
    
    if exist "%MOD_RPKG14%" (
        if not exist "!HITMAN_PATH!\Simple Mod Framework\Mods\HITMAN 3 Sub Indo\chunk14" (
            mkdir "!HITMAN_PATH!\Simple Mod Framework\Mods\HITMAN 3 Sub Indo\chunk14" >nul 2>&1
        )
        copy /Y "%MOD_RPKG14%" "!HITMAN_PATH!\Simple Mod Framework\Mods\HITMAN 3 Sub Indo\chunk14\sub_indo_c14.rpkg" >nul
    )
    
    echo File mod berhasil disalin ke folder SMF (chunk0 & chunk14).
    echo.
    echo [3/3] Menjalankan Deploy SMF otomatis...
    if exist "!HITMAN_PATH!\Simple Mod Framework\Deploy.exe" (
        cd /d "!HITMAN_PATH!\Simple Mod Framework"
        .\Deploy.exe --doNotPause
        cd /d "%SCRIPT_DIR%"
    ) else (
        echo Silakan buka SMF Mod Manager lalu klik "Apply / Deploy" untuk mengaktifkan mod.
    )
) else (
    echo [2/3] Membuat backup file asli game (packagedefinition.txt)...
    if not exist "!HITMAN_PATH!\Runtime\packagedefinition.txt.bak" (
        copy /Y "!HITMAN_PATH!\Runtime\packagedefinition.txt" "!HITMAN_PATH!\Runtime\packagedefinition.txt.bak" >nul
        echo Backup berhasil dibuat: packagedefinition.txt.bak
    ) else (
        echo Backup asli sudah ada, melewati langkah ini.
    )
    echo.
    echo [3/3] Memasang mod Subtitle Bahasa Indonesia...
    copy /Y "%MOD_RPKG0%" "!HITMAN_PATH!\Runtime\chunk0patch5.rpkg" >nul
    if exist "%MOD_RPKG14%" (
        copy /Y "%MOD_RPKG14%" "!HITMAN_PATH!\Runtime\chunk14patch5.rpkg" >nul
    )
    copy /Y "%MOD_PKGDEF%" "!HITMAN_PATH!\Runtime\packagedefinition.txt" >nul
)

color 0A
echo.
echo ======================================================================
echo    PEMASANGAN MOD SELESAI & BERHASIL! (SUKSES)
echo ======================================================================
echo.
echo Langkah selanjutnya:
echo 1. Buka game HITMAN World of Assassination seperti biasa.
echo 2. Pastikan bahasa di game diatur ke "ENGLISH" (mod menimpa teks English).
echo 3. WAJIB DI DALAM GAME: Masuk ke Options -^> Gameplay / Audio -^> Subtitles: ON.
echo    (Hitman mematikan subtitle secara default, jadi harus di-ON-kan manual).
echo.
echo Selamat bermain! Agent 47 siap beraksi dalam Bahasa Indonesia!
echo.
pause
