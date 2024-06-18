import 'package:flutter/material.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_controller.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_page.dart';
import 'package:poc/pages/s020_shared_counter/shared_counter_state.dart';
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
    return StateProvider<SharedCounterState>(
      (context) => SharedCounterState(),
      builder: (context, data) => StateProvider(
        (context) => S010MainMenuController(getNavigator),
        builder: (context, data) => MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const S010MainMenuPage(),
        ),
      ),
    );
  }
//   return StateProvider<SharedCounterState>(
//   (context) => SharedCounterState(),
//   builder: (context) => StateProvider(
//   (context) => S010MainMenuController(getNavigator),
//   builder: (context) => MaterialApp(
//   navigatorKey: navigatorKey,
//   title: 'Flutter Demo',
//   theme: ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//   useMaterial3: true,
//   ),
//   home: const S010MainMenuPage(),
//   ),
//   ),
//   );
// }
}
