import 'package:flutter/widgets.dart';
import 'package:poc/state_provider/disposable.dart';

class StateProvider<T> extends StatefulWidget {
  const StateProvider(
    this.create, {
    super.key,
    required this.child,
  });

  final T Function(BuildContext context) create;

  final Widget child;

  static T of<T>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_StateInheritedWidget<T>>()!
        .state;
  }

  @override
  State<StateProvider> createState() => _StateProviderState<T>();
}

class _StateProviderState<T> extends State<StateProvider> {
  /// The state object created by the [StateProvider].
  late final T _state;

  @override
  void initState() {
    super.initState();
// Create the initial state object using the provided create function.
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
  Widget build(BuildContext context) {
    return _StateInheritedWidget<T>(
      state: _state,
      child: widget.child,
    );
  }
}

/// An [InheritedWidget] that provides access to the state object.
///
/// This widget is used internally by [StateProvider] to make the state object
/// accessible throughout the widget tree using [StateProvider.of<T>].
class _StateInheritedWidget<T> extends InheritedWidget {
  const _StateInheritedWidget({
    super.key,
    required this.state,
    required super.child,
  });

  /// The state object created by [StateProvider].
  final T state;

  /// No need to notify children when the state object changes, as
  /// this is handled by the classes in the Signals package.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
