# gemini ai app code

## flutter code guy
maximilian schwarzmuller
https://maximilian-schwarzmueller.com/

https://www.udemy.com/user/maximilian-schwarzmuller/

## dummy api app
https://reqres.in

## dart sdk
https://dart.dev/get-dart
(macOS)
brew tap dart-lang/dart
brew install dart

brew info dart

PATH
Verify PATH includes Homebrew
#
Verify that your PATH includes the Homebrew bin directory. Setting up the correct path simplifies using Dart SDK commands such as dart run and dart format.

To get help configuring your PATH, consult the Homebrew FAQ.

for android studio, use the following folder->
/usr/local/opt/dart/libexec

Installed
/usr/local/Cellar/dart-sdk/3.10.9

(macOS)
(ensure flutter installed and $PATH configured)
brew install flutter

brew info flutter

/Users/markrobinson/Documents/flutter/bin/cache/dart-sdk

## flutter commands
add         Add a dependency to pubspec.yaml.
cache       Work with the Pub system cache.
deps        Print package dependencies.
downgrade   Downgrade packages in a Flutter project.
get         Get the current package's dependencies.
global      Work with Pub global packages.
login       Log into pub.dev.
logout      Log out of pub.dev.
outdated    Analyze dependencies to find which ones can be upgraded.
pub         Pass the remaining arguments to Dart's "pub" tool.
publish     Publish the current package to pub.dartlang.org.
remove      Removes a dependency from the current package.
run         Run an executable from a package.
test        Run the "test" package.
token       Manage authentication tokens for hosted pub repositories.
upgrade     Upgrade the current package's dependencies to latest versions.
uploader    Manage uploaders for a package on pub.dev.
version     Print Pub version.

## dart commands
build       Build a Dart application including code assets.
compile     Compile Dart to various formats.
create      Create a new Dart project.
pub         Work with packages.
run         Run a Dart program.
test        Run tests for a project.

Source code
analyze     Analyze Dart code in a directory.
doc         Generate API documentation for Dart projects.
fix         Apply automated fixes to Dart source code.
format      Idiomatically format Dart source code.

Tools
devtools    Open DevTools (optionally connecting to an existing application).
info        Show diagnostic information about the installed tooling.

## Install dependencies:**
    Fetch the necessary Flutter packages.
    ```bash
    flutter pub get

## Connect an Android device or start an emulator:**
    *   **Physical Device:** Enable USB debugging on your Android device and connect it to your computer.
    *   **Emulator:** Open Android Studio, go to `Tools > Device Manager`, and start an Android Virtual Device (AVD).

    You can verify that your device is recognized by Flutter using:
    ```bash
    flutter devices
    ```

## Run the application:**
    Once your device or emulator is ready, run the application using:
    ```bash
    flutter run
    ```
    This command will build the app and install it on your connected device or running emulator.

## code
Building a Flutter app with these features requires a mix of UI layout (Scaffold & Drawer), State Management, and HTTP networking.
Below is a complete, single-file example (main.dart) that you can paste into a new Flutter project. It uses a mock API to simulate a login flow.
1. Add Dependencies
First, add the http package to your pubspec.yaml file:
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

2. The Flutter Code (main.dart)
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

// --- LOGIN SCREEN ---
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Mock API Call
  Future<void> _login() async {
    setState(() => _isLoading = true);

    try {
      // Using reqres.in for a real-world testing API
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email": _emailController.text,
          "password": _passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        // Success: Navigate to Home
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Failure: Show error
        final errorMsg = jsonDecode(response.body)['error'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Failed: $errorMsg')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Network error occurred')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email (try: eve.holt@reqres.in)'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}

// --- HOME SCREEN (With Burger Menu) ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        // The Drawer automatically adds the "Burger" icon to the AppBar
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('App Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              ),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Welcome! You are logged in.')),
    );
  }
}

Key Components Explained
| Feature | Implementation |
|---|---|
| Burger Menu | Created using the drawer property of the Scaffold. Flutter automatically places the icon in the AppBar. |
| API Calling | Uses the http package to send a POST request to reqres.in (a public testing API). |
| Loading State | A boolean _isLoading toggles between the login button and a CircularProgressIndicator. |
| Navigation | Uses Navigator.pushReplacement so that users can't "Go Back" to the login screen once authenticated. |
> Note: For a real app, you should use a more robust state management solution (like Provider, Riverpod, or Bloc) to handle user tokens and sessions.
>
Would you like me to show you how to securely store the API token using flutter_secure_storage?