import 'package:flutter/material.dart';

// providerを使うと、このクラスで状態管理することができる
class CountModel extends ChangeNotifier {
  int counter = 0;
  int counter2 = 0;

  void incrementCounter1() {
    counter++;
    // StateFullWidgetでいうSetStateの役割
    notifyListeners();
  }

  void incrementCounter2() {
    counter2 += 10;
    notifyListeners();
  }
}
