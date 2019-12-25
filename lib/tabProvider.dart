import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int currentPage = 0;

  changePage(int page) {
    currentPage = page;
    notifyListeners();
  }
}
