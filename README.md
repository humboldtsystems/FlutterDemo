# Flutter Demo Application

This project is a basic Flutter application demonstrating a login screen with a navigation drawer.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes, specifically for Android.

### Prerequisites

Before you begin, ensure you have the following installed:

*   **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
*   **Android Studio**: [Install Android Studio](https://developer.android.com/studio/install) (includes Android SDK and command-line tools)
*   **A text editor or IDE**: Visual Studio Code with the Flutter extension is recommended.

### Installation and Running on Android

Follow these steps to get the application running on an Android device or emulator:

1.  **Clone the repository (if you haven't already):**
    ```bash
    git clone https://github.com/your-username/FlutterDemo.git
    cd FlutterDemo
    ```
    *(Note: If you already have the project files, navigate to the project root directory.)*

2.  **Install dependencies:**
    Fetch the necessary Flutter packages.
    ```bash
    flutter pub get
    ```

3.  **Connect an Android device or start an emulator:**
    *   **Physical Device:** Enable USB debugging on your Android device and connect it to your computer.
    *   **Emulator:** Open Android Studio, go to `Tools > Device Manager`, and start an Android Virtual Device (AVD).

    You can verify that your device is recognized by Flutter using:
    ```bash
    flutter devices
    ```

4.  **Run the application:**
    Once your device or emulator is ready, run the application using:
    ```bash
    flutter run
    ```
    This command will build the app and install it on your connected device or running emulator.

The application should now be running on your Android device or emulator. You will see a login screen with a hamburger menu icon in the top-left corner. Tap the icon to open the navigation drawer and explore the placeholder pages.

## Project Structure

*   `lib/main.dart`: Entry point of the application.
*   `lib/login_screen.dart`: The main login screen.
*   `lib/app_drawer.dart`: The reusable navigation drawer widget.
*   `lib/placeholder_page_1.dart`: A sample placeholder page.
*   `lib/placeholder_page_2.dart`: Another sample placeholder page.
*   `lib/config.dart`: Configuration file for the application (e.g., API endpoints).

Feel free to explore and modify the code.
