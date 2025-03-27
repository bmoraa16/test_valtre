import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  static final SecureStorageManager _instance =
      SecureStorageManager._internal();

  factory SecureStorageManager() {
    return _instance;
  }

  SecureStorageManager._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  write(String key, String value) async {
    await _instance._storage.write(key: key, value: value);
    return null;
  }

  Future<String?> read(String key) async {
    final value = await _instance._storage.read(key: key);
    return value;
  }

  static Future<void> deleteKey(String key) async {
    await _instance._storage.delete(key: key);
  }

  deleteAll() async {
    await _instance._storage.deleteAll();
  }

  static Future<void> deleteAllKeys() async {
    await _instance._storage.deleteAll();
  }

  static Future<void> setExample(String example) async {
    await _instance._storage.write(key: "exampleString", value: example);
  }

  static Future<String> getExample() async {
    return await _instance._storage.read(key: "exampleString") ?? "";
  }

  /*
  DataCustom Example
  static Future<void> setUser(User user) async {
    final userJson = jsonEncode(user.toDto.toJson());
    await _instance._storage.write(key: "user", value: userJson);
  }

  static Future<User> getUser() async {
    final userJson = await _instance._storage.read(key: "user");
    final user = UserDto.fromJson(jsonDecode(userJson ?? ''));
    return user.toDomain;
  }

    static Future<void> setRxLocation(LocationInfo locationInfo) async {
    final location = jsonEncode(locationInfo.toJson());
    await _instance._storage.write(key: "rxLocation", value: location);
  }

  static Future<LocationInfo?> getRxLocation() async {
    final location = await _instance._storage.read(key: "rxLocation");
    if (location == null) {
      return null;
    }
    return (location.isNotEmpty)
        ? LocationInfo.fromJson(jsonDecode(location))
        : null;
  }
  */
}
