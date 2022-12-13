import 'package:flutter/material.dart';
import 'package:travel_animation/pages/main_page.dart';
import 'package:travel_animation/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Animation',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.mainBlack,
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
