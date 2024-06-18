import 'package:flutter/material.dart';

typedef StateBuilderCallBack<T> = Widget Function(BuildContext context, T data);

class StateBuilder<T> extends StatelessWidget {
  final T data;
  final StateBuilderCallBack<T> builder;

  const StateBuilder({
    super.key,
    required this.data,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context, data);
  }
}
