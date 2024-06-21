import 'package:signals/signals.dart';

class S030CounterController {
  final counter = Signal(0, debugLabel: 's040_counter');

  void incrementCounterPressed() {
    counter.value++;
  }
}
