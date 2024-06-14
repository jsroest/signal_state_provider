import 'package:flutter/material.dart';
import 'package:poc/pages/s040_multi_counter/s040_multi_counter_controller.dart';
import 'package:poc/pages/widgets/watch_text.dart';
import 'package:poc/state_provider/state_provider.dart';

class S040MultiCounterPage extends StatelessWidget {
  const S040MultiCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      () => S040MultiCounterController(),
      builder: (context) {
        final controller =
            StateProvider.of<S040MultiCounterController>(context);
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
                WatchText(controller.counter1),
                WatchText(controller.counter2),
                WatchText(controller.counter3),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: controller.incrementCounter1Pressed,
                tooltip: 'Increment 1',
                child: const Text('1'),
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                heroTag: null,
                onPressed: controller.incrementCounter2Pressed,
                tooltip: 'Increment 2',
                child: const Text('2'),
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                heroTag: null,
                onPressed: controller.incrementCounter3Pressed,
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
