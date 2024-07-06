import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  bool get isMobile => screenSize.width < 450;

  bool get isTablet => (screenSize.width >= 450) && (screenSize.width < 800);

  bool get isLabtop => (screenSize.width >= 800) && (screenSize.width < 1200);

  bool get isDesktop => screenSize.width >= 1200;
}
