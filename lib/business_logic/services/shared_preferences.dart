// @packages
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const KEY_ID_TOKEN = 'token';

class SecureStorage {
  final secureStorage = const FlutterSecureStorage();

  Future<void> setValue(String key, String? value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String> getValue(String key) async {
    try {
      final value = (await secureStorage.read(key: key))!;
      return value;
    } catch (_) {
      return '';
    }
  }

  Future<void> deleteValue(String key) async {
    await secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await secureStorage.deleteAll();
  }
}
