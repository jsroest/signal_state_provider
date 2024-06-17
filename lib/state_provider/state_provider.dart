import 'package:flutter/widgets.dart';
import 'package:poc/state_provider/disposable.dart';

typedef StateBuilder<T> = Widget Function(BuildContext context, T state);

/// A widget for storing state.
///
/// The primary purpose of this widget is to provide a convenient way to store
/// and access state objects, such as Signals and Effects from the Signals
/// package, within a Flutter app.
///
/// Example usage:
///
/// ```dart
/// StateProvider<MyStateClass>(
///   create: () => MyStateClass(),
///   builder: (context) {
///     // Access state object using StateProvider.of<MyStateClass>(context)
///     final state = StateProvider.of<MyStateClass>(context);
///     return ...
///   },
/// )
/// ```
class StateProvider<T> extends StatefulWidget {
  const StateProvider(
    this.create, {
    super.key,
    this.builder,
  });

  /// Create a new StateProvider
  ///
  /// Create a new StateProvider based on this StateProvider, but with the
  /// provided builder. This is used by the MultiStateProvider to create a
  /// nested list of providers based on StateProviders with no builders
  /// specified.
  StateProvider<T> createNewWith({required StateBuilder builder}) =>
      StateProvider<T>(
        create,
        builder: builder,
      );

  /// Creates a state object.
  ///
  /// This function is called once during the lifecycle of the [StateProvider] to
  /// create the initial state object.
  final T Function() create;

  /// Builds the child widgets using the state object.
  ///
  /// The [StateProvider] will be accessible in the context used by this builder.
  /// See [Builder] for more details.
  final StateBuilder<T>? builder;

  /// Retrieves the state object from the current context.
  ///
  /// Use this method to access the state object created by the [StateProvider]
  /// from anywhere in the widget tree.
  ///
  /// Example:
  ///
  /// ```dart
  /// final state = StateProvider.of<MyStateClass>(context);
  /// ```
  static T of<T>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_StateInheritedWidget<T>>()!
        .state;
  }

  // Default createState method that every StatefulWidget needs
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
    _state = widget.create();
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
      child: Builder(
        builder: (context) => widget.builder!(context, _state),
      ),
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
