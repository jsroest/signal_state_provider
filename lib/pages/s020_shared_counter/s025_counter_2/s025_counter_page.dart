import 'package:flutter/material.dart';
import 'package:poc/pages/s020_shared_counter/s025_counter_2/s025_counter_controller.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:signals/signals_flutter.dart';

class S025CounterPage extends StatelessWidget {
  const S025CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = StateProvider.of<S025CounterController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter 2'),
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
