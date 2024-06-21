import 'package:poc/pages/s020_shared_counter/shared_counter_state.dart';

class S020CounterController {
  S020CounterController(this.sharedCounterState);

  final SharedCounterState sharedCounterState;

  void incrementCounterPressed() {
    sharedCounterState.counter.value++;
  }
}
