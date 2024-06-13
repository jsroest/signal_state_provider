import 'package:flutter/foundation.dart';
import 'package:poc/state_provider/disposable.dart';
import 'package:signals/signals_flutter.dart';

class CounterState implements Disposable {
  CounterState({this.debugLabel});

  final String? debugLabel;

  late final Signal counter = Signal(0, debugLabel: debugLabel)
    ..onDispose(() => debugPrint("I'm disposed"));

  @override
  void dispose() {
    counter.dispose();
  }
}
