import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return desktop ?? const SizedBox.shrink();
      } else if (constraints.maxWidth <= 1100 && constraints.maxWidth >= 850) {
        return tablet ?? const SizedBox.shrink();
      } else {
        return mobile ?? const SizedBox.shrink();
      }
    });
  }
}
