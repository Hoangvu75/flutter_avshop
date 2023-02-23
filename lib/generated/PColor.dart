import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Brightness brightness = SchedulerBinding.instance.window.platformBrightness;

class PColors {
  static Color background = const Color.fromRGBO(237, 245, 255, 1.0);

  static Color defaultTextColor = Colors.black;

  static Color gradientButtonStart = const Color.fromRGBO(50, 0, 150, 1.0);
  static Color gradientButtonEnd = const Color.fromRGBO(0, 75, 150, 1.0);
  static Color blueMain = const Color.fromRGBO(33, 57, 146, 1.0);
}
