import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Watch<T> extends StatelessWidget {
  const Watch({
    super.key,
    required this.valueListenable,
    required this.builder,
    this.child,
  });

  final ValueListenable<T> valueListenable;
  final Widget Function(
    BuildContext context,
    T value,
  ) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: valueListenable,
      builder: (context, _) => builder(
        context,
        valueListenable.value,
      ),
      child: child,
    );
  }
}
