# 🕵️ Detect IT 🤖

An intelligent, multi-utility application built with Flutter that brings the power of AI to your fingertips for real-time image detection, data extraction, and creative generation.

-----

## ✨ Key Features

  * **🖼️ Gallery Integration:** Securely grant media permissions to browse your entire photo gallery directly within the app.
  * **🔍 AI Object Detection:** Select any image from your gallery or camera to detect and identify objects within it.
  * **📸 Live Camera Capture:** Use the in-app camera for instant image capture and analysis.
  * **🧮 AI Math Solver:** Snap a photo of a mathematical expression, and let the AI solve it for you.
  * **🎨 AI Image Generation:** Unleash your creativity by generating unique images from text prompts using advanced AI models.
  * **✨ Interactive UI:** A smooth and engaging user experience enhanced with beautiful [Rive](https://rive.app/) animations and custom-designed components.

-----

## 🛠️ Technologies Used

  * **Frontend:** [Flutter](https://flutter.dev/)
  * **Backend & AI:** [Firebase](https://firebase.google.com/) (ML Kit, Storage)
  * **Animations:** [Rive](https://rive.app/)
  * **Language:** [Dart](https://dart.dev/)

-----

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

  * Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
  * A Firebase project: [Firebase Console](https://console.firebase.google.com/)

### Installation

1.  **Clone the repository:**

    ```sh
    git clone https://github.com/AdityaJandu/Detect_It.git
    cd Detect_It
    ```

2.  **Set up Firebase:**

      * Create a new project on the [Firebase Console](https://console.firebase.google.com/).
      * Add an Android and/or iOS app to your Firebase project.
      * **For Android:** Download the `google-services.json` file and place it in the `android/app/` directory.
      * **For iOS:** Download the `GoogleService-Info.plist` file and place it in the `ios/Runner/` directory using Xcode.
      * In the Firebase console, navigate to **Build \> ML Kit** and ensure the necessary models are available.

3.  **Configure Permissions:**
    This app requires Camera and Media/Photo Gallery access. Make sure you add the necessary permissions.

      * **For iOS (`ios/Runner/Info.plist`):**
        ```xml
        <key>NSCameraUsageDescription</key>
        <string>This app needs camera access to capture images for detection.</string>
        <key>NSPhotoLibraryUsageDescription</key>
        <string>This app needs photo library access to select images for detection.</string>
        ```
      * **For Android (`android/app/src/main/AndroidManifest.xml`):**
        ```xml
        <uses-permission android:name="android.permission.CAMERA" />
        <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
        ```

4.  **Install dependencies:**

    ```sh
    flutter pub get
    ```

5.  **Run the application:**

    ```sh
    flutter run
    ```

-----

## 📂 Project Structure

The project follows a feature-driven directory structure to keep the codebase organized and scalable.

```
lib/
├── components/              # Reusable UI widgets and custom components
│   ├── alert_dialogs.dart
│   ├── back_ground_animations.dart
│   ├── back_ground_blur.dart
│   ├── button_animation.dart
│   ├── curved_bar.dart
│   ├── gradient_text.dart
│   ├── my_buttons.dart
│   ├── my_drawer.dart
│   ├── my_text_fields.dart
│   ├── positioned_image.dart
│   ├── rich_text_span.dart
│   └── widget_tiles.dart
│
├── screens/
│   ├── ai_intergration/     # AI-based features
│   │   ├── image_generate.dart
│   │   └── math_notes.dart
│   │
│   ├── auth/                # Authentication and user management
│   │   ├── auth_gate.dart
│   │   ├── auth_service.dart
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   │
│   ├── core_ui/             # Main UI screens
│   │   ├── feature_screen.dart
│   │   ├── home_screen.dart
│   │   ├── info_screen.dart
│   │   ├── profile_screen.dart
│   │   └── splash_screen.dart
│   │
│   └── gallery_and_camera/  # Media handling screens
│       ├── album_screen.dart
│       ├── camera_screen.dart
│       └── view_picture_screen.dart
│
├── firebase_options.dart    # Firebase configuration
└── main.dart                # App entry point


```

-----

## 🤝 Contributing

Contributions are what make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/NewAIModel`)
3.  Commit your Changes (`git commit -m 'Add NewAIModel'`)
4.  Push to the Branch (`git push origin feature/NewAIModel`)
5.  Open a Pull Request

-----


