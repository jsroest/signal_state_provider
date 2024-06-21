import 'package:signals/signals.dart';

class S040MultiCounterController {
  final counter1 = Signal(0, debugLabel: 's050_counter_1');
  final counter2 = Signal(0, debugLabel: 's050_counter_2');
  final counter3 = Signal(0, debugLabel: 's050_counter_3');

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
