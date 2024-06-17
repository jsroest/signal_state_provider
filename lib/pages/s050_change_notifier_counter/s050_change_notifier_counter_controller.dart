import 'package:flutter/material.dart';
import 'package:poc/helpers/property.dart';

class S050ChangeNotifierCounterController extends ChangeNotifier {
  late final counter1 = Property(0, notifyListeners);
  late final counter2 = Property(0, notifyListeners);
  late final counter3 = Property(0, notifyListeners);

  void incrementCounter1Pressed() {
    counter1.value++;
  }

  void incrementCounter2Pressed() {
    counter2.value++;
  }

  void incrementCounter3Pressed() {
    counter3.value++;
  }
}
