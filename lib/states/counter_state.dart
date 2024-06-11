import 'package:flutter/foundation.dart';
import 'package:signals/signals_flutter.dart';

class CounterState {
  CounterState({this.debugLabel});

  final String? debugLabel;

  late final Signal counter = Signal(0, debugLabel: debugLabel)
    ..onDispose(() => debugPrint("I'm disposed"));
}
