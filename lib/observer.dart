import 'package:flutter/cupertino.dart';

class Observer extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    //viewModel notifies Ui => HomeLessPage
    _counter++;
    notifyListeners(); // = setState
  }

  // if there is an under score in variables it cannot be called in another fila -> ((_)score)

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void clear() {
    _counter = 0;
    notifyListeners();
  }
}
