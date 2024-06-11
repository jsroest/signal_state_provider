import 'package:flutter/widgets.dart';
import 'package:poc/state_provider/state_provider.dart';

class StateProviderBuilder<T> {
  StateProviderBuilder(this.create);

  final T Function() create;

  StateProvider<T> build(WidgetBuilder builder) => StateProvider<T>(
        create: create,
        builder: builder,
      );
}
