import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class WatchText extends StatelessWidget {
  const WatchText(
    this.signal, {
    super.key,
  });

  final Signal signal;

  @override
  Widget build(BuildContext context) {
    return Watch(
      (context) => Text(
        '${signal.value}',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
