import 'package:flutter/material.dart';
import 'package:poc/pages/counter_page.dart';
import 'package:poc/pages/multi_counter_page.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:poc/states/counter_state.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Main menu'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Counter 1'),
            subtitle: const Text('Shared state'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const CounterPage(title: 'Counter 1');
                },
              ),
            ),
          ),
          ListTile(
            title: const Text('Counter 2'),
            subtitle: const Text('Shared state'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CounterPage(title: 'Counter 2'),
              ),
            ),
          ),
          ListTile(
            title: const Text('Counter 3'),
            subtitle: const Text('Local state'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StateProvider(
                    create: () => CounterState(debugLabel: 'Counter 3 local'),
                    builder: (context) {
                      return const CounterPage(
                          title: 'Counter 3, with local state');
                    }),
              ),
            ),
          ),
          ListTile(
            title: const Text('Counter 4'),
            subtitle: const Text('Multiple local states'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MultiCounterPage(
                    title: 'Counter 4, with multiple local states'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
