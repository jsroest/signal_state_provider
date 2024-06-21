import 'package:flutter/material.dart';

class NavigatorService {
  NavigatorService(this._navigatorKey);

  final GlobalKey<NavigatorState> _navigatorKey;

  NavigatorState get navigator => _navigatorKey.currentState!;
}
