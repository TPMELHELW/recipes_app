import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/recipes/view/home_screen/screen/home_screen.dart';
import 'package:recipes_app/utils/theme/theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
