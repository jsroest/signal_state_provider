import 'package:flutter/widgets.dart';
import 'package:poc/state_provider/state_provider.dart';

/// A widget that provides multiple StateProviders to its child widget.
///
/// This widget is useful when you have multiple StateProviders that need to be
/// combined and provided to a sub tree of widgets.
class MultiStateProvider extends StatelessWidget {
  /// Creates a new instance of [MultiStateProvider].
  ///
  /// The [stateProviders] parameter is a list of [StateProvider] objects that
  /// will be provided to the child widget.
  ///
  /// The [builder] parameter is a [WidgetBuilder] function that is used to
  /// build the child widget.
  const MultiStateProvider({
    super.key,
    required this.stateProviders,
    required this.builder,
  });

  /// A list of [StateProvider] objects that will be provided to the child widget.
  final List<StateProvider> stateProviders;

  /// A [WidgetBuilder] function that is used to build the child widget.
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    /// A variable to hold the current [StateProvider].
    StateProvider? current;

    /// Loop through the [stateProviders] in reverse order.
    for (final stateProvider in stateProviders.reversed) {
      if (current == null) {
        /// If [current] is null, create a new instance of the [StateProvider]
        /// using the [builder] function.
        current = stateProvider.createNewWith(builder: builder);
      } else {
        /// If [current] is not null, create a new instance of the [StateProvider]
        /// with the [current] widget as its child.
        final child = current;
        current = stateProvider.createNewWith(builder: (context) => child);
      }
    }

    /// Return the final [StateProvider] widget.
    return current!;
  }
}
