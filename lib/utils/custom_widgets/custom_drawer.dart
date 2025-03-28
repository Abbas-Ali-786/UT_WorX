import 'package:flutter/material.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      builder: (context, responsive) {
        final logoHeight = responsive.deviceValue(
          mobile: 60.0,
          tablet: 70.0,
          desktop: 80.0,
        );

        final iconSize = responsive.deviceValue(
          mobile: 20.0,
          tablet: 22.0,
          desktop: 24.0,
        );

        final fontSize = responsive.deviceValue(
          mobile: 13.0,
          tablet: 14.0,
          desktop: 15.0,
        );

        final drawerWidth = responsive.deviceValue(
          mobile: 240.0,
          tablet: 260.0,
          desktop: 280.0,
        );

        return SizedBox(
          width: drawerWidth,
          child: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: logoHeight + 40,
                  child: DrawerHeader(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: logoHeight,
                    ),
                  ),
                ),
                _drawerItem(
                  Icons.dashboard,
                  "Dashboard",
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _drawerItem(
                  Icons.create,
                  "Work Creation",
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _drawerItem(
                  Icons.description_outlined,
                  "Preliminary Report",
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _drawerItem(
                  Icons.calendar_today_outlined,
                  "Work Scheduling",
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _drawerItem(
                  Icons.insert_chart_outlined_outlined,
                  "Service Report",
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                _drawerItem(
                  Icons.task_outlined,
                  "Report Generation",
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _drawerItem(
    IconData icon,
    String title, {
    double? iconSize,
    double? fontSize,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0XFFA3AED0),
        size: iconSize,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: Color(0XFFA3AED0),
        ),
      ),
      onTap: () {},
    );
  }
}
