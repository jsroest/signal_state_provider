import 'package:flutter/material.dart';
import 'package:poc/pages/s040_multi_counter/s040_multi_counter_controller.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:signals/signals_flutter.dart';

class S040MultiCounterPage extends StatelessWidget {
  const S040MultiCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      () => S040MultiCounterController(),
      builder: (context, state) {
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
                  (context) => Text(
                    '${state.counter1.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Watch(
                  (context) => Text(
                    '${state.counter2.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Watch(
                  (context) => Text(
                    '${state.counter3.value}',
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
    );
  }
}
