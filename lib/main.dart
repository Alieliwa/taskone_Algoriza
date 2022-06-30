import 'package:flutter/material.dart';
import 'package:taskone/modules/onboarding_screen/onboarding_screen.dart';
import 'package:taskone/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task One',
      debugShowCheckedModeBanner: false,
      theme: lightthemes,
      home: const OnBoardingScreen(),
    );
  }
}
