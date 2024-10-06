# Flutter Image Labeling  📸

A Flutter application demonstrating how to implement image labeling using the [Google ML Kit Image Labeling](https://pub.dev/packages/google_mlkit_image_labeling) package. Users can either pick an image from the gallery or capture an image using the camera, and the app will label the image using machine learning.

---

## 🌟 Features

- 📸 **Pick or Capture Image**: Pick an image from the gallery or capture one using the camera.
- 🔖 **Image Labeling**: Leverage Google ML Kit to label objects in images.
- 📊 **Confidence Scores**: Each label comes with a confidence score.
- 📜 **Customizable Confidence Threshold**: Set confidence threshold to filter results.

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** (Ensure you have the latest stable Flutter SDK installed)
- **Android Studio / Xcode** (for Android and iOS development)
- **Google ML Kit Image Labeling** package

### Installation

1. Add the following dependencies to your `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_mlkit_image_labeling: ^latest_version
  image_picker: ^latest_version
```

2. Run `flutter pub get` to install the dependencies.

### ⚙️ Configuration

#### Android

1. Update the minimum Android SDK requirements in `android/app/build.gradle`

```gradle
android {
    compileSdkVersion 34

    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
    }
}
```

2. Add the required permissions in `android/app/src/main/AndroidManifest.xml`

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

#### iOS

1. Add the following permissions to `ios/Runner/Info.plist`:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select images.</string>
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to capture images.</string>
```

### 📚 Usage

1. **Image Labeling**:
   - Pick or capture an image using the built-in `ImagePickerHelper`
   - Pass the selected image to the `ImageLabelingHelper` to process and label the image.

2. Reference this [Flutter Image Picker Guide](https://github.com/mahmoodhamdi/flutter-image-picker-guide) if you're unfamiliar with image selection or capture in Flutter.

---

## 🏗️ Project Structure

```bash
lib/
├── app.dart                # Main entry point for the app
├── home_page.dart          # Home page UI for displaying picked or captured image and labels
├── image_labeling_helper.dart  # Helper class for image labeling functionality
├── image_picker_helper.dart    # Helper class for image selection and capture
└── main.dart               # App initialization and camera setup
```

---

### 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Quote

> "مَن غَدَا إلى المَسْجِدِ ورَاحَ، أعَدَّ اللَّهُ له نُزُلَهُ مِنَ الجَنَّةِ كُلَّما غَدَا أوْ رَاحَ."
> صحيح البخاري
