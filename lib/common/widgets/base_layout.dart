import 'package:flutter/material.dart';
import 'package:subscription/common/extension/context_ext.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout(
      {super.key, this.mobile, this.tablet, this.laptop, this.desktop});

  final Widget? mobile;
  final Widget? tablet;
  final Widget? laptop;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return mobile ?? const Text("Mobile View");
    } else if (context.isTablet) {
      return tablet ?? const Text("Tablet View");
    } else if (context.isLabtop) {
      return laptop ?? const Text("Laptop View");
    } else {
      return desktop ?? const Text("Desktop View");
    }
  }
}
