# Autoyard

> A cross-platform Flutter application for managing vehicle yard operations — bookings, inspections, digital signatures, and real-time reporting — backed by Firebase.

---

## Overview

Autoyard is a full-featured vehicle yard management system built with Flutter and Firebase. It streamlines the day-to-day workflow of auto yards by providing digital job cards, signature capture, image uploads, push notifications, and a real-time Firestore database — all in a clean, responsive UI.

## Features

- **Vehicle Job Management** — Create, assign, and track vehicle service or inspection jobs
- **Digital Signature Capture** — Collect client/technician signatures via Syncfusion Signature Pad
- **Image Picker** — Attach vehicle photos directly to job records
- **Firebase Backend** — Real-time data sync with Cloud Firestore + Firebase Storage
- **Push Notifications** — Firebase Cloud Messaging (FCM) for job updates and alerts
- **Hive Local Cache** — Offline-ready local storage for fast access without network
- **Date & Calendar Picker** — Schedule jobs with intuitive date pickers
- **Cross-Platform** — Runs on Android, iOS, Web, Windows, macOS, and Linux
- **GetX State Management** — Lightweight reactive state and navigation management

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | GetX |
| Backend | Firebase (Firestore, Storage, Messaging) |
| Local Storage | Hive |
| Signature | Syncfusion Flutter SignaturePad |
| UI Utilities | flutter_screenutil, flutter_svg, flutter_spinkit |
| HTTP | http package |
| Media | image_picker, image |

## Project Structure

```
autoyard/
├── android/          # Android platform files
├── ios/              # iOS platform files
├── web/              # Web platform files
├── windows/          # Windows platform files
├── macos/            # macOS platform files
├── linux/            # Linux platform files
├── assets/           # Static assets (images, icons, fonts)
├── lib/              # Main Dart source code
│   ├── main.dart
│   ├── bindings/     # GetX dependency injection
│   ├── controllers/  # GetX controllers
│   ├── models/       # Data models
│   ├── views/        # UI screens & widgets
│   └── services/     # Firebase & API services
├── test/             # Unit & widget tests
├── firebase.json     # Firebase project config
├── pubspec.yaml      # Flutter dependencies
└── README.md
```

## Getting Started

### Prerequisites

- Flutter SDK `>=3.3.0 <4.0.0`
- Dart SDK
- Android Studio / Xcode (for mobile)
- A Firebase project with Firestore, Storage, and FCM enabled

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/SalooMughal/Autoyard.git
   cd Autoyard
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) and place them in the respective platform folders
   - Update `firebase.json` with your project settings

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web
```

## Usage

1. Log in or sign up through the app
2. Create a new **Job Card** for a vehicle (enter details, attach photos)
3. Assign the job to a technician and set a due date
4. Capture a **digital signature** upon job completion
5. View reports and job history in the dashboard

## Contributing

Pull requests are welcome. Please open an issue first to discuss proposed changes.

## License

This project is licensed under the MIT License.
