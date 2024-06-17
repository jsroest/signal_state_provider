import 'package:flutter/material.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_controller.dart';
import 'package:poc/state_provider/state_provider.dart';

class S010MainMenuPage extends StatelessWidget {
  const S010MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      () => S010MainMenuController(Navigator.of(context)),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Main menu'),
          ),
          body: ListView(
            children: [
              ListTile(
                title: const Text('Counter 1'),
                subtitle: const Text('Shared counter'),
                onTap: state.onTapMenuItem1,
              ),
              ListTile(
                title: const Text('Counter 2'),
                subtitle: const Text('Shared counter'),
                onTap: state.onTapMenuItem2,
              ),
              ListTile(
                title: const Text('Counter 3'),
                subtitle: const Text('Local state'),
                onTap: state.onTapMenuItem3,
              ),
              ListTile(
                title: const Text('Counter 4'),
                subtitle: const Text('Multiple local states'),
                onTap: state.onTapMenuItem4,
              ),
              ListTile(
                title: const Text('Counter 5'),
                subtitle: const Text('ChangeNotifier'),
                onTap: state.onTapMenuItem5,
              ),
              ListTile(
                title: const Text('Counter 6'),
                subtitle: const Text('ChangeNotifiers'),
                onTap: state.onTapMenuItem6,
              ),
              ListTile(
                title: const Text('Counter 7'),
                subtitle: const Text('PropertyBuilder'),
                onTap: state.onTapMenuItem7,
              ),
              ListTile(
                title: const Text('Counter 8'),
                subtitle: const Text('PropertyBuilder'),
                onTap: state.onTapMenuItem8,
              ),
            ],
          ),
        );
      },
    );
  }
}
