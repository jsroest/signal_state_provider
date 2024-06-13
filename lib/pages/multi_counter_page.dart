import 'package:flutter/material.dart';
import 'package:poc/state_provider/multi_state_provider.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:poc/states/multi_counters.dart';
import 'package:signals/signals_flutter.dart';

class MultiCounterPage extends StatelessWidget {
  const MultiCounterPage({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return MultiStateProvider(
        stateProviders: [
          StateProvider<MultiCounter1>(
            create: () => MultiCounter1(debugLabel: 'Counter 4 local 1'),
          ),
          StateProvider<MultiCounter2>(
            create: () => MultiCounter2(debugLabel: 'Counter 4 local 2'),
          ),
          StateProvider<MultiCounter3>(
            create: () => MultiCounter3(debugLabel: 'Counter 4 local 3'),
          ),
        ],
        builder: (context) {
          final multiCounter1 = StateProvider.of<MultiCounter1>(context);
          final multiCounter2 = StateProvider.of<MultiCounter2>(context);
          final multiCounter3 = StateProvider.of<MultiCounter3>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('$title $subTitle'),
            ),
            body: Center(
              child: Watch((context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${multiCounter1.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '${multiCounter2.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '${multiCounter3.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                );
              }),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () => multiCounter1.counter.value++,
                  tooltip: 'Increment 1',
                  child: const Text('1'),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () => multiCounter2.counter.value++,
                  tooltip: 'Increment 2',
                  child: const Text('2'),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () => multiCounter3.counter.value++,
                  tooltip: 'Increment 3',
                  child: const Text(
                    '3',
                  ),
                ),
              ],
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
