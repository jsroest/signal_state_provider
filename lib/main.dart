import 'package:flutter/material.dart';
import 'package:poc/controllers/controllers.dart';
import 'package:poc/pages/s010_main_menu/s010_main_menu_page.dart';
import 'package:poc/services/navigator_service.dart';
import 'package:poc/services/services.dart';
import 'package:poc/state_provider/nested.dart';
import 'package:poc/state_provider/state_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        ...services,
        ...controllers,
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          navigatorKey:
              StateProvider.of<NavigatorService>(context).navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const S010MainMenuPage(),
        );
      }),
    );
  }
}
