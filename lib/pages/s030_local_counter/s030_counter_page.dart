import 'package:flutter/material.dart';
import 'package:poc/pages/s030_local_counter/s030_counter_controller.dart';
import 'package:poc/state_provider/state_provider.dart';

class S030CounterPageLocal extends StatelessWidget {
  const S030CounterPageLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      () => S030CounterController(),
      builder: (context) {
        final controller = StateProvider.of<S030CounterController>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Counter 3 local counter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${controller.counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: controller.incrementCounterPressed,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
