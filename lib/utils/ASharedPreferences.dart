import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class ASharedPreferences {
  static SharedPreferences? _sharedPreferences;
  static String? _uniqueKey;

  static Future<SharedPreferences> get() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  static Future<String> _getUniqueKey() async {
    if (_uniqueKey == null) {
      _uniqueKey = (await get())?.getString("nii_share_preferences_key");
      if (_uniqueKey == null) {
        _uniqueKey =
            "nii_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(99999)}";
        (await get())?.setString("nii_share_preferences_key", _uniqueKey!);
      }
    }
    return _uniqueKey!;
  }

  static Future<String?> getString(String key) async {
    return (await get())?.getString("${_getUniqueKey()}_$key");
  }

  static setString(String key, String value) async {
    (await get())?.setString("${_getUniqueKey()}_$key", value);
  }

  static Future<int?> getInt(String key) async {
    return (await get())?.getInt("${_getUniqueKey()}_$key");
  }

  static setInt(String key, int value) async {
    (await get())?.setInt("${_getUniqueKey()}_$key", value);
  }

  static Future<bool?> getBool(String key) async {
    return (await get())?.getBool("${_getUniqueKey()}_$key");
  }

  static setBool(String key, bool value) async {
    (await get())?.setBool("${_getUniqueKey()}_$key", value);
  }

  static Future<double?> getDouble(String key) async {
    return (await get())?.getDouble("${_getUniqueKey()}_$key");
  }

  static setDouble(String key, double value) async {
    (await get())?.setDouble("${_getUniqueKey()}_$key", value);
  }

  static Future<T?> getObject<T>(String key) async {
    String? objectString = (await get())?.getString("${_getUniqueKey()}_$key");
    T? object;
    if(objectString!=null) {object = jsonDecode(objectString);}
    return object;
  }

  static setObject(String key, Object value) async {
    String objectJson = jsonEncode(value);
    (await get())?.setString("${_getUniqueKey()}_$key", objectJson);
  }

}
