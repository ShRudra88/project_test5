import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_test5/app_theme.dart';
import 'package:project_test5/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(   // material app for getx
      debugShowCheckedModeBanner: false,
      title: 'Flutter CRUD app',
      theme: AppTheme.lightTheme,  // the common theme
      home: HomeScreen(),
    );
  }
}
