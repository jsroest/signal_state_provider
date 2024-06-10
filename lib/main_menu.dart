import 'package:flutter/material.dart';
import 'package:poc/counter_page.dart';
import 'package:poc/counter_state.dart';
import 'package:poc/state_widget.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

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
                builder: (context) => StateWidget(
                    create: () =>
                        CounterState(debugLabel: 'Local counter state'),
                    builder: (context) {
                      return const CounterPage(
                          title: 'Counter 3, with local state');
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
