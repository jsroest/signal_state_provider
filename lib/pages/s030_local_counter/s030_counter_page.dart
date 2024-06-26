import 'package:flutter/material.dart';
import 'package:poc/pages/s030_local_counter/s030_counter_controller.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:signals/signals_flutter.dart';

class S030CounterPage extends StatelessWidget {
  const S030CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      (_) => S030CounterController(),
      child: Builder(builder: (context) {
        final controller = StateProvider.of<S030CounterController>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Counter 3'),
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
                    '${controller.counter.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
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
      }),
    );
  }
}
