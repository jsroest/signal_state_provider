import 'package:signals/signals.dart';

class CounterState {
  CounterState({String? debugLabel}) {
    counter = Signal(
      0,
      debugLabel: debugLabel,
    );
  }

  late final Signal counter;
}
