import 'package:flutter/material.dart';
import 'package:flutter_challenge/features/onboarding/pages/onboarding.dart';
import 'package:flutter_challenge/shared/shared.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter challenge',
      theme: AppTheme.themeData,
      home: const OnboardingScreen(),
    );
  }
}
