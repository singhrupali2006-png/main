# Flutter and Dart SDK: Installation & Environment Setup Guide (Exp 1a)

This guide provides automated and manual instructions to install Flutter and Dart SDK on Windows, macOS, and Linux.

---

## 1. System Requirements

### Windows
- **Operating System**: Windows 10/11 (64-bit)
- **Disk Space**: At least 2.5 GB (excluding IDE and SDK tools)
- **Tools**: Git for Windows, Windows PowerShell 5.0 or later

### macOS
- macOS 10.15 (Catalina) or later
- Xcode 14+ for iOS development

### Linux
- 64-bit Debian/Ubuntu/Fedora
- `curl`, `git`, `unzip`, `xz-utils`, `zip`, `libglu1-mesa`

---

## 2. Automated Installation via PowerShell (Windows)

A PowerShell installation script is provided in `scripts/install_flutter.ps1`.

Run the following command in PowerShell as Administrator:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\scripts\install_flutter.ps1
```

---

## 3. Manual Installation Steps

### Step 1: Download Flutter SDK
1. Visit the official Flutter download portal: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
2. Download the stable bundle zip file (e.g. `flutter_windows_3.x.x-stable.zip`).
3. Extract the zip to `C:\src\flutter` (Do **NOT** install in `C:\Program Files\` to avoid privilege issues).

### Step 2: Configure System Environment Variables
1. Press `Win + S` and search for **Environment Variables**.
2. Click **Edit the system environment variables**.
3. Under **User variables**, select **Path** and click **Edit**.
4. Click **New** and add:
   ```
   C:\src\flutter\bin
   ```
5. Click **OK** to save.

### Step 3: Verify Installation
Open a new terminal window and run:

```bash
flutter doctor -v
dart --version
```

Expected output:
```text
[✓] Flutter (Channel stable, 3.24.0, on Microsoft Windows [Version 10.0.22631.3880], locale en-US)
[✓] Windows Version (Installed version of Windows is version 10 or higher)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Chrome - develop for the web
[✓] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.8.3)
[✓] Android Studio (version 2024.1)
[✓] VS Code (version 1.91.1)
[✓] Connected device (3 available)
[✓] Network resources
• No issues found!
```

---

## 4. Enabling Flutter Web

Flutter includes built-in web support using the Dart SDK:

```bash
flutter config --enable-web
flutter devices
```

To run a Flutter web app:
```bash
flutter run -d chrome
```
