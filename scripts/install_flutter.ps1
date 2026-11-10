# Automated Flutter and Dart SDK Installer for Windows
# Run as Administrator or user with permission to modify user PATH

[CmdletBinding()]
param (
    [string]$InstallPath = "C:\src\flutter",
    [string]$Branch = "stable"
)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " Flutter & Dart SDK Automated Installer   " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# 1. Check Git
$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitCmd) {
    Write-Host "[ERROR] Git is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/download/win and rerun." -ForegroundColor Yellow
    exit 1
}
Write-Host "[OK] Git detected: $(git --version)" -ForegroundColor Green

# 2. Prepare installation directory
$parentDir = Split-Path $InstallPath -Parent
if (-not (Test-Path $parentDir)) {
    Write-Host "[INFO] Creating parent directory: $parentDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
}

if (-not (Test-Path $InstallPath)) {
    Write-Host "[INFO] Cloning Flutter SDK ($Branch branch) into $InstallPath..." -ForegroundColor Yellow
    git clone https://github.com/flutter/flutter.git -b $Branch $InstallPath
} else {
    Write-Host "[INFO] Flutter directory already exists at $InstallPath. Updating..." -ForegroundColor Yellow
    Push-Location $InstallPath
    git pull
    Pop-Location
}

# 3. Add to User Environment Path
$flutterBin = Join-Path $InstallPath "bin"
$userPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if ($userPath -split ';' -notcontains $flutterBin) {
    Write-Host "[INFO] Adding $flutterBin to User PATH..." -ForegroundColor Yellow
    $newPath = "$userPath;$flutterBin"
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
    $env:Path = "$env:Path;$flutterBin"
    Write-Host "[OK] PATH updated successfully." -ForegroundColor Green
} else {
    Write-Host "[OK] $flutterBin is already in User PATH." -ForegroundColor Green
}

# 4. Verify installation
Write-Host "[INFO] Running flutter doctor to initialize tools..." -ForegroundColor Cyan
& "$flutterBin\flutter.bat" doctor

Write-Host "==========================================" -ForegroundColor Green
Write-Host " Flutter & Dart SDK setup completed!      " -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
