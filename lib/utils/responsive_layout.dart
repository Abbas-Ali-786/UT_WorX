import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget Function(BuildContext context, ResponsiveInfo info) builder;

  // Custom breakpoints as per your requirements
  final double mobileBreakpoint;
  final double tabletBreakpoint;

  const ResponsiveLayout({
    super.key,
    required this.builder,
    this.mobileBreakpoint = 500, // Changed from 600 to 500
    this.tabletBreakpoint = 800, // Changed from 1200 to 800
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final ResponsiveInfo info = ResponsiveInfo(
          constraints: constraints,
          deviceType: _getDeviceType(constraints.maxWidth),
          mobileBreakpoint: mobileBreakpoint,
          tabletBreakpoint: tabletBreakpoint,
        );

        return builder(context, info);
      },
    );
  }

  DeviceType _getDeviceType(double width) {
    if (width < mobileBreakpoint) {
      return DeviceType.mobile;
    } else if (width < tabletBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }
}

enum DeviceType { mobile, tablet, desktop }

class ResponsiveInfo {
  final BoxConstraints constraints;
  final DeviceType deviceType;
  final double mobileBreakpoint;
  final double tabletBreakpoint;

  const ResponsiveInfo({
    required this.constraints,
    required this.deviceType,
    required this.mobileBreakpoint,
    required this.tabletBreakpoint,
  });

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;

  // Helper methods for responsive sizing
  double get screenWidth => constraints.maxWidth;
  double get screenHeight => constraints.maxHeight;

  // Get responsive values based on screen size
  double responsiveWidth(double percentage) => screenWidth * percentage;

  // Get value based on device type
  T deviceValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }
}
