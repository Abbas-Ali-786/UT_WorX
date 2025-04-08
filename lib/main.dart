import 'package:flutter/material.dart';
import 'package:ut_worx/view/auth/login_screen.dart';
import 'package:ut_worx/view/dashboard/dashboard_screen.dart';
import 'package:ut_worx/view/notification_creation/notification_screen.dart';
import 'package:ut_worx/view/preliminary_report/preliminary_report_screen.dart';
import 'package:ut_worx/view/work_scheduling/work_scheduling_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkScheduling(),
    );
  }
}
