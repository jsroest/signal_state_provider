import 'package:flutter/material.dart';
import 'package:poc/pages/counter_page_local.dart';
import 'package:poc/pages/counter_page_shared.dart';
import 'package:poc/pages/multi_counter_page.dart';

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
                  return const CounterPageShared(
                    title: 'Counter 1',
                    subTitle: 'shared',
                  );
                },
              ),
            ),
          ),
          ListTile(
            title: const Text('Counter 2'),
            subtitle: const Text('Shared state'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CounterPageShared(
                  title: 'Counter 2',
                  subTitle: 'shared',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Counter 3'),
            subtitle: const Text('Local state'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CounterPageLocal(
                  title: 'Counter 3',
                  subTitle: 'local',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Counter 4'),
            subtitle: const Text('Multiple local states'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MultiCounterPage(
                  title: 'Counter 4',
                  subTitle: 'multiple local',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
