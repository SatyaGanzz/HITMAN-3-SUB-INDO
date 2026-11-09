@echo off
setlocal enabledelayedexpansion
title Uninstaller Subtitle Bahasa Indonesia - HITMAN World of Assassination
color 0C

echo ======================================================================
echo    UNINSTALLER - Kembalikan HITMAN ke Bahasa Inggris Asli
echo ======================================================================
echo.

set "HITMAN_PATH="

if exist "C:\Program Files (x86)\Steam\steamapps\common\HITMAN 3\Runtime" (
    set "HITMAN_PATH=C:\Program Files (x86)\Steam\steamapps\common\HITMAN 3"
)
if not defined HITMAN_PATH (
    if exist "D:\SteamLibrary\steamapps\common\HITMAN 3\Runtime" (
        set "HITMAN_PATH=D:\SteamLibrary\steamapps\common\HITMAN 3"
    )
)
if not defined HITMAN_PATH (
    if exist "E:\SteamLibrary\steamapps\common\HITMAN 3\Runtime" (
        set "HITMAN_PATH=E:\SteamLibrary\steamapps\common\HITMAN 3"
    )
)
if not defined HITMAN_PATH (
    if exist "C:\Program Files\Epic Games\HITMAN3\Runtime" (
        set "HITMAN_PATH=C:\Program Files\Epic Games\HITMAN3"
    )
)
if not defined HITMAN_PATH (
    echo Masukkan path folder HITMAN 3 kamu:
    set /p "HITMAN_PATH=Path: "
    set "HITMAN_PATH=!HITMAN_PATH:"=!"
)

if not exist "!HITMAN_PATH!\Runtime" (
    echo [ERROR] Folder game tidak valid.
    pause
    exit /b 1
)

echo Menghapus file mod chunk0patch5.rpkg...
if exist "!HITMAN_PATH!\Runtime\chunk0patch5.rpkg" (
    del /f /q "!HITMAN_PATH!\Runtime\chunk0patch5.rpkg"
)

echo Mengembalikan backup packagedefinition.txt...
if exist "!HITMAN_PATH!\Runtime\packagedefinition.txt.bak" (
    copy /Y "!HITMAN_PATH!\Runtime\packagedefinition.txt.bak" "!HITMAN_PATH!\Runtime\packagedefinition.txt" >nul
    del /f /q "!HITMAN_PATH!\Runtime\packagedefinition.txt.bak"
    echo Backup berhasil dipulihkan!
)

color 0A
echo.
echo ======================================================================
echo    MOD BERHASIL DIHAPUS. Game kembali ke pengaturan awal developer.
echo ======================================================================
echo.
pause
