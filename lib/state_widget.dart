import 'package:flutter/material.dart';

/// A widget for storing state.
///
/// The primary purpose of this widget is to provide a convenient way to store
/// and access state objects, such as Signals and Effects from the Signals
/// package, within a Flutter app.
///
/// Example usage:
///
/// ```dart
/// StateWidget<MyStateClass>(
///   create: () => MyStateClass(),
///   builder: (context) {
///     // Access state object using StateWidget.of<MyStateClass>(context)
///     final state = StateWidget.of<MyStateClass>(context);
///     return ...
///   },
/// )
/// ```
class StateWidget<T> extends StatefulWidget {
  const StateWidget({
    super.key,
    required this.create,
    required this.builder,
  });

  /// Creates a state object.
  ///
  /// This function is called once during the lifecycle of the [StateWidget] to
  /// create the initial state object.
  final T Function() create;

  /// Builds the child widgets using the state object.
  ///
  /// The [StateWidget] will be accessible in the context used by this builder.
  /// See [Builder] for more details.
  final WidgetBuilder builder;

  /// Retrieves the state object from the current context.
  ///
  /// Use this method to access the state object created by the [StateWidget]
  /// from anywhere in the widget tree.
  ///
  /// Example:
  ///
  /// ```dart
  /// final state = StateWidget.of<MyStateClass>(context);
  /// ```
  static T of<T>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_StateInheritedWidget<T>>()!
        .state;
  }

  // Default createState method that every StatefulWidget needs
  @override
  State<StateWidget> createState() => _StateWidgetState<T>();
}

class _StateWidgetState<T> extends State<StateWidget> {
  /// The state object created by the [StateWidget].
  late final T state;

  @override
  void initState() {
    super.initState();
    // Create the initial state object using the provided create function.
    state = widget.create();
  }

  @override
  Widget build(BuildContext context) {
    return _StateInheritedWidget<T>(
      state: state,
      child: Builder(
        builder: widget.builder,
      ),
    );
  }
}

/// An [InheritedWidget] that provides access to the state object.
///
/// This widget is used internally by [StateWidget] to make the state object
/// accessible throughout the widget tree using [StateWidget.of<T>].
class _StateInheritedWidget<T> extends InheritedWidget {
  const _StateInheritedWidget({
    super.key,
    required this.state,
    required super.child,
  });

  /// The state object created by [StateWidget].
  final T state;

  /// No need to notify children when the state object changes, as
  /// this is handled by the classes in the Signals package.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
