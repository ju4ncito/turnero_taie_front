import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future setField(String key, value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> getField(key) async {
    return await _storage.read(key: key);
  }

  static Future<void> clearAccessToken() async {
    await _storage.delete(key: 'accessToken');
  }

  static Future<void> clearRefreshToken() async {
    await _storage.delete(key: 'refreshToken');
  }
}
