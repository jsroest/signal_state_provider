import 'package:flutter/material.dart';

class NavigatorService {
  NavigatorService();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => navigatorKey.currentState!;
}
