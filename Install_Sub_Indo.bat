@echo off
setlocal enabledelayedexpansion
title Installer Subtitle Bahasa Indonesia - HITMAN World of Assassination
color 0B

echo ======================================================================
echo    HITMAN: World of Assassination - Mod Subtitle & UI Bahasa Indonesia
echo ======================================================================
echo.

set "SCRIPT_DIR=%~dp0"
set "MOD_RPKG=%SCRIPT_DIR%mod_files\chunk0patch5.rpkg"
set "MOD_PKGDEF=%SCRIPT_DIR%mod_files\packagedefinition.txt"

if not exist "%MOD_RPKG%" (
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

echo [2/3] Membuat backup file asli game (packagedefinition.txt)...
if not exist "!HITMAN_PATH!\Runtime\packagedefinition.txt.bak" (
    copy /Y "!HITMAN_PATH!\Runtime\packagedefinition.txt" "!HITMAN_PATH!\Runtime\packagedefinition.txt.bak" >nul
    echo Backup berhasil dibuat: packagedefinition.txt.bak
) else (
    echo Backup asli sudah ada, melewati langkah ini.
)

echo.
echo [3/3] Memasang mod Subtitle Bahasa Indonesia...
copy /Y "%MOD_RPKG%" "!HITMAN_PATH!\Runtime\chunk0patch5.rpkg" >nul
copy /Y "%MOD_PKGDEF%" "!HITMAN_PATH!\Runtime\packagedefinition.txt" >nul

color 0A
echo.
echo ======================================================================
echo    PEMASANGAN MOD SELESAI & BERHASIL! (SUKSES)
echo ======================================================================
echo.
echo Langkah selanjutnya:
echo 1. Buka game HITMAN World of Assassination dari Steam / Epic seperti biasa.
echo 2. Pastikan bahasa di game diatur ke "ENGLISH" (karena mod menimpa teks English).
echo 3. Di dalam game: Masuk ke Options -> Audio / Gameplay -> Subtitles: ON.
echo.
echo Selamat bermain!
echo.
pause
