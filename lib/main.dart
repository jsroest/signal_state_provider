import 'package:flutter/material.dart';
import 'package:poc/pages/main_menu_page.dart';
import 'package:poc/state_provider/state_provider.dart';
import 'package:poc/states/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      create: () => CounterState(debugLabel: 'Shared'),
      builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainMenuPage(),
      ),
    );
  }
}
