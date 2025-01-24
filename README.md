# cal_ai

# Flutter App

This is a basic Flutter application built using Flutter version 3.24.4.

## Requirements

- Flutter SDK 3.24.4 using FVM
- Dart SDK 3.24.4
- Android Studio or Visual Studio Code
- Android or iOS emulator, or a physical device

## Installation

1. **Install Flutter:**
   - Download and install Flutter 3.24.4 from the official [Flutter website](https://flutter.dev/docs/get-started/install).

OR

### 1. Install FVM

FVM (Flutter Version Manager) is a tool to manage Flutter versions easily.

- Install FVM by running the following command:
  ```bash
  dart pub global activate fvm
- fvm install 3.24.4


2. **Set Up Environment:**
   - Add Flutter to your system PATH.
   - Verify the installation by running:
     ```bash
     flutter doctor
     ```

3. **Run the App:**
   - To run the app on an emulator or physical device, use the following command:
     ```bash
     flutter run
     ```

## Project Structure

- `lib/`: Contains the Dart code for the app.
  - `main.dart`: The entry point of the application.

## Building for Production

1. **Build APK (Android):**
   ```bash
   flutter build apk --release