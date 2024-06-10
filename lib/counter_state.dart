import 'package:signals/signals.dart';

class CounterState {
  final counter = Signal(
    0,
    debugLabel: 'counter',
  );
}
