import 'package:flutter/material.dart';
import 'package:poc/pages/s080_watch_counter/s080_watch_counter_controller.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:poc/watch/watch.dart';

class S080WatchCounterPage extends StatelessWidget {
  const S080WatchCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      (context) => S080WatchCounterController(),
      child: Builder(
        builder: (context) {
          final state = StateProvider.of<S080WatchCounterController>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text('Counter 4 multi local counter'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Watch(
                    valueListenable: state.counter1,
                    builder: (context, value) => Text(
                      '$value',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Watch(
                    valueListenable: state.counter2,
                    builder: (context, value) => Text(
                      '$value',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Watch(
                    valueListenable: state.counter3,
                    builder: (context, value) => Text(
                      '$value',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: state.incrementCounter1Pressed,
                  tooltip: 'Increment 1',
                  child: const Text('1'),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: state.incrementCounter2Pressed,
                  tooltip: 'Increment 2',
                  child: const Text('2'),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: state.incrementCounter3Pressed,
                  tooltip: 'Increment 3',
                  child: const Text('3'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
