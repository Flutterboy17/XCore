import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:xcore/screens/home_screen.dart';
import 'const/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "XCore",
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kBg1Color,
          fontFamily: "SF Pro Display",
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.kBg1Color,
          )),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
