import 'package:flutter/material.dart';
import 'package:poc/controllers/controllers.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_page.dart';
import 'package:poc/services/services.dart';
import 'package:poc/state_provider/nested.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        ...services(navigatorKey),
        ...controllers,
      ],
      child: MaterialApp(
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
