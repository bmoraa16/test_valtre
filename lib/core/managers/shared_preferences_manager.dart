import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._internal();

  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferencesManager._internal() {
    SharedPreferences.getInstance().then((value) => preferences = value);
  }

  late SharedPreferences preferences;

  static Future<void> removeKey(String key) async {
    await _instance.preferences.remove(key);
  }

  static Future<String> getExampleString() async =>
      _instance.preferences.getString("example") ?? "";

  static Future<void> setExampleString(String example) async {
    await _instance.preferences.setString("example", example);
  }

  static Future<void> setExampleint(int status) async {
    _instance.preferences.setInt("intExample", status);
  }

  static Future<int> getExampleint() async {
    return _instance.preferences.getInt("intExample") ?? 0;
  }

  static Future<void> setBoolExample(bool value) async {
    await _instance.preferences.setBool('boolExample', value);
  }

  static Future<bool> getBoolExample() async {
    return _instance.preferences.getBool("boolExample") ?? false;
  }

  /*Data Custom Example
    static Future<void> setDrLocation(LocationInfo locationInfo) async {
    final location = jsonEncode(locationInfo.toJson());
    await _instance.preferences.setString("drLocation", location);
  }

  static Future<LocationInfo?> getDrLocation() async {
    final location = _instance.preferences.getString("drLocation") ?? "";
    return location.isNotEmpty
        ? LocationInfo.fromJson(jsonDecode(location))
        : null;
  }
  */
}
