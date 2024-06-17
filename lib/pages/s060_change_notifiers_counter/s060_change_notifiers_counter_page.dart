import 'package:flutter/material.dart';
import 'package:poc/pages/s060_change_notifiers_counter/s060_change_notifiers_counter_controller.dart';
import 'package:poc/state_provider/state_provider.dart';

class S060ChangeNotifiersCounterPage extends StatelessWidget {
  const S060ChangeNotifiersCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      () => S060ChangeNotifiersCounterController(),
      builder: (context) {
        final controller =
            StateProvider.of<S060ChangeNotifiersCounterController>(context);
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
                ListenableBuilder(
                  listenable: controller.counter1,
                  builder: (context, _) => Text(
                    '${controller.counter1.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                ListenableBuilder(
                  listenable: controller.counter2,
                  builder: (context, _) => Text(
                    '${controller.counter2.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                ListenableBuilder(
                  listenable: controller.counter3,
                  builder: (context, _) => Text(
                    '${controller.counter3.value}',
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
