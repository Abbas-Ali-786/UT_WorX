import 'package:flutter/material.dart';
import 'package:ut_worx/view/auth_screens/login_screen.dart';
import 'package:ut_worx/view/dashboard_screen/dashboard_screen.dart';
import 'package:ut_worx/view/preliminary_report_screen/preliminary_report_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PreliminaryReportScreen(),
    );
  }
}
