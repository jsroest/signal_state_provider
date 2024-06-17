import 'package:flutter/material.dart';
import 'package:poc/pages/s020_shared_counter/s025_counter_2/s025_counter_2_controller.dart';
import 'package:poc/pages/s020_shared_counter/shared_counter_state.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:signals/signals_flutter.dart';

class S025Counter2PageShared extends StatelessWidget {
  const S025Counter2PageShared({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      () => S025Counter2Controller(
        StateProvider.of<SharedCounterState>(context),
      ),
      builder: (context) {
        final controller = StateProvider.of<S025Counter2Controller>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Counter 2 shared counter'),
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
                    '${controller.sharedCounterState.counter.value}',
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
      },
    );
  }
}
