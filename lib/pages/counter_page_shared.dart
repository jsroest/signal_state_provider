import 'package:flutter/material.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:poc/states/counter_state.dart';
import 'package:signals/signals_flutter.dart';

class CounterPageShared extends StatelessWidget {
  const CounterPageShared({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final counterState = StateProvider.of<CounterState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$title $subTitle'),
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
                '${counterState.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterState.counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
