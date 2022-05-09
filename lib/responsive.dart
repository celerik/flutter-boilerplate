// @packages
import 'package:flutter/material.dart';

// @constants
import 'package:flutter_boilerplate/config/styles/sizes.dart';

/// This helper widget allows to wraps another three widgets and give for one
/// screen just many designs and dimensions depending of the device whether if it's
/// a mobile, tablet or desktop. The sizes for each device are some of the most
/// common from the market.
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < Sizes.mobileDevice;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < Sizes.tabletDevice &&
      MediaQuery.of(context).size.width >= Sizes.mobileDevice;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= Sizes.tabletDevice;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= Sizes.tabletDevice) {
          print('Desktop');
          return desktop;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= Sizes.mobileDevice) {
          print('Tablet');
          return tablet;
        }
        // Or less then that we called it mobile
        return mobile;
      },
    );
  }
}
