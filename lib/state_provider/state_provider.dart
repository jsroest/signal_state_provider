import 'package:flutter/widgets.dart';
import 'package:poc/state_provider/disposable.dart';
import 'package:poc/state_provider/nested.dart';

class StateProvider<T> extends SingleChildStatefulWidget {
  const StateProvider(
    this.create, {
    super.key,
    super.child,
  });

  final T Function(BuildContext context) create;

  static T of<T>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_StateInheritedWidget<T>>()!
        .state;
  }

  @override
  State<StateProvider> createState() => _StateProviderState<T>();
}

class _StateProviderState<T> extends SingleChildState<StateProvider> {
  late final T _state;

  @override
  void initState() {
    super.initState();
    _state = widget.create(context);
  }

  @override
  void dispose() {
    if (_state is Disposable) {
      _state.dispose();
    }
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return _StateInheritedWidget<T>(
      state: _state,
      child: child!,
    );
  }
}

class _StateInheritedWidget<T> extends InheritedWidget {
  const _StateInheritedWidget({
    super.key,
    required this.state,
    required super.child,
  });

  final T state;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
