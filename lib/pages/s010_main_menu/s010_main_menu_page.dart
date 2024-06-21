import 'package:flutter/material.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_controller.dart';
import 'package:poc/state_provider/state_provider.dart';

class S010MainMenuPage extends StatelessWidget {
  const S010MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = StateProvider.of<S010MainMenuController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Main menu'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Counter 1'),
            subtitle: const Text('Signals, shared state'),
            onTap: controller.onTapMenuItem1,
          ),
          ListTile(
            title: const Text('Counter 2'),
            subtitle: const Text('Signals, shared state'),
            onTap: controller.onTapMenuItem2,
          ),
          ListTile(
            title: const Text('Counter 3'),
            subtitle: const Text('Signals, local state'),
            onTap: controller.onTapMenuItem3,
          ),
          ListTile(
            title: const Text('Counter 4'),
            subtitle: const Text('Signals, multiple local states'),
            onTap: controller.onTapMenuItem4,
          ),
          ListTile(
            title: const Text('Counter 5'),
            subtitle: const Text('ChangeNotifier, 1 notifier for more states'),
            onTap: controller.onTapMenuItem5,
          ),
          ListTile(
            title: const Text('Counter 6'),
            subtitle: const Text('ChangeNotifiers, each state a notifier V1'),
            onTap: controller.onTapMenuItem6,
          ),
          ListTile(
            title: const Text('Counter 7'),
            subtitle: const Text('ChangeNotifiers, each state a notifier V2'),
            onTap: controller.onTapMenuItem7,
          ),
          ListTile(
            title: const Text('Counter 8'),
            subtitle: const Text('ValueNotifiers, each state a notifier'),
            onTap: controller.onTapMenuItem8,
          ),
        ],
      ),
    );
  }
}
