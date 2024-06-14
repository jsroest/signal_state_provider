import 'package:signals/signals.dart';

class SharedCounterState {
  final counter = Signal(0, debugLabel: 's020_shared_counter');
}
