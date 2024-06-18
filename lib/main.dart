import 'package:flutter/material.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_controller.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_page.dart';
import 'package:poc/pages/s020_shared_counter/s020_counter_1/s020_counter_1_controller.dart';
import 'package:poc/pages/s020_shared_counter/shared_counter_state.dart';
import 'package:poc/state_provider/multi_state_provider.dart';
import 'package:poc/state_provider/state_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState getNavigator() => navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiStateProvider(
      [
        StateProvider<SharedCounterState>((_) => SharedCounterState()),
        StateProvider<S010MainMenuController>(
            (_) => S010MainMenuController(getNavigator)),
        StateProvider<S020Counter1Controller>(
          (context) => S020Counter1Controller(
            StateProvider.of<SharedCounterState>(context),
          ),
        ),
      ],
      builder: (context) => MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const S010MainMenuPage(),
      ),
    );
  }
}
