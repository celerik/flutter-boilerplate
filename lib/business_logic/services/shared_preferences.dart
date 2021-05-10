import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  dynamic getValueFromKey(String key) {
    if (_sharedPrefs == null) {
      return null;
    }
    return _sharedPrefs.get(key);
  }

  Future<bool> setValueAndKey(String key, String value) {
    if (_sharedPrefs == null) {
      return Future.value(false);
    }
    return _sharedPrefs.setString(key, value);
  }

  Future<dynamic> reset() async {
    await _sharedPrefs.clear();
  }
}
