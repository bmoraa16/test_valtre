import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/app.dart';
import 'package:flutter_test_project/core/di/injection.dart';
import 'package:flutter_test_project/core/managers/secure_storage_manager.dart';
import 'package:flutter_test_project/core/managers/shared_preferences_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  SharedPreferencesManager();
  SecureStorageManager();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const TestApp());
}
