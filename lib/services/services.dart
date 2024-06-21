import 'package:flutter/material.dart';
import 'package:poc/services/navigator_service.dart';
import 'package:poc/state_provider/nested.dart';
import 'package:poc/state_provider/state_provider.dart';

List<SingleChildWidget> services(GlobalKey<NavigatorState> navigatorKey) => [
      StateProvider(
        (context) => NavigatorService(navigatorKey),
      ),
    ];
