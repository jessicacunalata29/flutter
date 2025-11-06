import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isDarkTheme = false;
  bool notificationsEnabled = true;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  void toggleNotifications() {
    notificationsEnabled = !notificationsEnabled;
    notifyListeners();
  }
}
