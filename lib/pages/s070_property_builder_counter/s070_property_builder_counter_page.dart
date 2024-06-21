import 'package:flutter/material.dart';
import 'package:poc/pages/s070_property_builder_counter/s070_property_builder_counter_controller.dart';
import 'package:poc/property_builder/property_builder.dart';
import 'package:poc/state_provider/state_provider.dart';

class S070PropertyBuilderCounterPage extends StatelessWidget {
  const S070PropertyBuilderCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        StateProvider.of<S070PropertyBuilderCounterController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter 7'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            PropertyBuilder(
              property: controller.counter1,
              builder: (context, value) => Text(
                '$value',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            PropertyBuilder(
              property: controller.counter2,
              builder: (context, value) => Text(
                '$value',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            PropertyBuilder(
              property: controller.counter3,
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
  }
}
