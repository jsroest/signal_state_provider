import 'package:flutter/material.dart';

class S080WatchCounterController {
  late final counter1 = ValueNotifier(0);
  late final counter2 = ValueNotifier(0);
  late final counter3 = ValueNotifier(0);

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
