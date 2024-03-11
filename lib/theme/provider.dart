import 'package:flutter/material.dart';
import 'package:news_homework/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  bool _isLight = true;

  ThemeData get themeData => _themeData;
  bool get isLight => _isLight;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
  set isLight(bool isLight) {
    _isLight = isLight;
    notifyListeners();
  }

  void turnOnLight() {
    themeData = lightTheme;
    isLight = true;
  }

  void turnOnDark() {
    themeData = darkTheme;
    isLight = false;
  }
}