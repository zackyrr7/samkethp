import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: hijauMain,
    scaffoldBackgroundColor: bgcolor,
    fontFamily: "mons",
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
