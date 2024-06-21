import 'package:poc/pages/s020_shared_counter/shared_counter_state.dart';

class S025CounterController {
  S025CounterController(this.sharedCounterState);

  final SharedCounterState sharedCounterState;

  void incrementCounterPressed() {
    sharedCounterState.counter.value++;
  }
}
