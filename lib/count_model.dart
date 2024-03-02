import 'package:flutter/material.dart';

// providerを使うと、このクラスで状態管理することができる
class CountModel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
