import 'package:bazarly_app/core/app_initializer.dart';
import 'package:bazarly_app/my_app.dart';
import 'package:flutter/material.dart';


void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize app services
  await AppInitializer.init();

  runApp(
    const MyApp(), 
  );
}
