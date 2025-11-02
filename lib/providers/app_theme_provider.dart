import 'package:flutter/material.dart';

import '../utils/shared_preferences_helper.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  AppThemeProvider() {
    getTheme();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  void getTheme() async {
    String theme = await getLastTheme();
    appTheme = (theme == "light")
        ? ThemeMode.light
        : (theme == "dark")
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
