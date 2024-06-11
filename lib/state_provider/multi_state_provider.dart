import 'package:flutter/widgets.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:poc/state_provider/state_provider_builder.dart';

typedef Create = Object Function();

class MultiStateProvider extends StatelessWidget {
  const MultiStateProvider({
    super.key,
    required this.stateProviderBuilders,
    required this.builder,
  });

  final List<StateProviderBuilder> stateProviderBuilders;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    StateProvider? current;
    for (final stateProviderBuilder in stateProviderBuilders.reversed) {
      if (current == null) {
        current = stateProviderBuilder.build(builder);
      } else {
        final child = current;
        current = stateProviderBuilder.build((context) => child);
      }
    }
    return current!;
  }
}
