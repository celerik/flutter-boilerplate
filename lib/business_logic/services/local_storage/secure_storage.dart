import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage? _secureStorage;

  factory SecureStorage() => SecureStorage._internal();

  SecureStorage._internal();

  static Future<void> init() async {
    _secureStorage ??= FlutterSecureStorage();
  }

  Future<void> setValue(String key, String? value) async {
    await _secureStorage!.write(key: key, value: value);
  }

  Future<String> getStringValue(String key) async {
    try {
      final value = (await _secureStorage?.read(key: key))!;
      return value;
    } catch (_) {
      return '';
    }
  }

  Future<void> deleteValue(String key) async {
    await _secureStorage?.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage?.deleteAll();
  }
}
