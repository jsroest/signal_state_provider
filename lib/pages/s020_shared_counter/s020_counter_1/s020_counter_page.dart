import 'package:flutter/material.dart';
import 'package:poc/pages/s020_shared_counter/s020_counter_1/s020_counter_1_controller.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:signals/signals_flutter.dart';

class S020CounterPage extends StatelessWidget {
  const S020CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = StateProvider.of<S020Counter1Controller>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter 1'),
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
                '${state.sharedCounterState.counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.incrementCounterPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
