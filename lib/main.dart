import 'package:flutter/material.dart';
import 'package:poc/counter_state.dart';
import 'package:poc/main_menu.dart';
import 'package:poc/state_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      create: () => CounterState(debugLabel: 'Shared counter state'),
      builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainMenu(),
      ),
    );
  }
}
