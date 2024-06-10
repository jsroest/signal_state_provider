import 'package:flutter/material.dart';

/// A widget for storing state.
///
/// The intended use case is to store Signals, Effects and other widgets from
/// the Signals package.
class StateWidget<T> extends StatefulWidget {
  const StateWidget({
    super.key,
    required this.create,
    required this.builder,
  });

  /// Create a state object
  ///
  /// This function is called once during the lifecycle of the StateWidget
  final T Function() create;

  /// Builder method for the child widgets
  ///
  /// The StateWidget will be accessible in the context used by the builder.
  /// https://api.flutter.dev/flutter/widgets/Builder-class.html
  final WidgetBuilder builder;

  /// Use this method to access the state object
  ///
  /// Use StateWidget.of<T> where ever you want to access properties in the state object
  static T of<T>(BuildContext context) {
    return context
        .findAncestorWidgetOfExactType<_StateInheritedWidget<T>>()!
        .state;
  }

  // Default createState method that every StatefulWidget needs
  @override
  State<StateWidget> createState() => _StateWidgetState<T>();
}

/// Private state class
class _StateWidgetState<T> extends State<StateWidget> {
  /// The state variable that holds the state in this StatefulWidget
  late final T state;

  /// The default initState method that every StatefulWidget needs.
  ///
  /// This method is called only once during the lifetime of a StatefulWidget
  @override
  void initState() {
    // Call super as requested in the documentation of the base class
    super.initState();
    // Call the user supplied method to create a state object.
    state = widget.create();
  }

  /// This method creates an InheritedWidget with a Builder as child.
  ///
  /// This Builder widget ensures that the InheritedWidget is in the context
  /// supplied to the builder method.
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

/// This inherited widget has an accessible state property of type T
class _StateInheritedWidget<T> extends InheritedWidget {
  const _StateInheritedWidget({
    super.key,
    required this.state,
    required super.child,
  });

  /// The state object that is created by [stateWidget]
  final T state;

  /// There will be never a need to notify the children to rebuild, because
  /// that is the responsibility of the classes in the Signals package.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
