import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  static const storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }

  static Future<void> logout() async {
    await storage.delete(key: 'auth_token');
  }
}
