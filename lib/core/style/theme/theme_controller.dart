import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  void toogle() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
      notifyListeners();
      return;
    }
    if (theme == ThemeMode.light) {
      theme = ThemeMode.dark;
      notifyListeners();
      return;
    }
  }

  void setTheme(ThemeMode theme) {
    this.theme = theme;
    notifyListeners();
  }
}
