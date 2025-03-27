# Running the Flutter App

This project is built with **Flutter 3.19.6**. Please ensure you have the correct version installed to avoid compatibility issues.

---

## ✅ Requirements

- **Flutter SDK**: `3.19.6`
- **Dart SDK**: Comes with Flutter
- **IDE**: VS Code, Android Studio, or any Flutter-supported editor
- **Device/Emulator**: Android or iOS

---

## 🚀 Getting Started

1. **Clone the repository**:
```bash
git clone git@github.com:bmoraa16/test_valtre.git your_folder_name
cd your_folder_name
```

2. **Install dependencies**:
```bash
flutter pub get
```

3. **Run code generation (if applicable)**:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**:
```bash
flutter run
```

---

## 🛠️ Flutter Version Info

You can verify your Flutter setup with:

```bash
flutter --version
```

Expected output:
```
Flutter 3.19.6 • channel stable • ...
```

If you're using `fvm`, you can set the version with:
```bash
fvm use 3.19.6
fvm flutter pub get
fvm flutter run
```

---

> Built using Flutter 3.19.6
