import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  int currentIndex = 0;

  void statusOfOrder(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
