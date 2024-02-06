import 'package:flutter/material.dart';

ThemeData redTheme = ThemeData(
  primaryColor: Colors.red,
  primarySwatch: Colors.red,
  iconTheme: const IconThemeData(color: Colors.red),
);
ThemeData greenTheme =
    ThemeData(primaryColor: Colors.green, primarySwatch: Colors.green);
ThemeData blueTheme = ThemeData(
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.blue.shade100,
);

getThemeData(String theme) {
  switch (theme) {
    case 'red':
      return redTheme;
    case 'blue':
      return blueTheme;
    default:
      return greenTheme;
  }
}
