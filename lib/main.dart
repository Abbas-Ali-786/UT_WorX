import 'package:flutter/material.dart';
import 'package:ut_worx/view/auth/login_screen.dart';
import 'package:ut_worx/view/pms/pms_screen.dart';
import 'package:ut_worx/view/report_generation/report_generation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
