import 'package:flutter/material.dart';
import 'package:poc/pages/s020_shared_counter/s020_counter_1/s020_counter_1_page.dart';
import 'package:poc/pages/s020_shared_counter/s025_counter_2/s025_counter_2_page.dart';
import 'package:poc/pages/s030_local_counter/s030_counter_page.dart';
import 'package:poc/pages/s040_multi_counter/s040_multi_counter_page.dart';
import 'package:poc/pages/s050_change_notifier_counter/s050_change_notifier_counter_page.dart';
import 'package:poc/pages/s060_change_notifiers_counter/s060_change_notifiers_counter_page.dart';
import 'package:poc/pages/s070_property_builder_counter/s070_property_builder_counter_page.dart';
import 'package:poc/pages/s080_watch_counter/s080_watch_counter_page.dart';
import 'package:poc/services/navigator_service.dart';

class S010MainMenuController {
  S010MainMenuController(this._navigatorService);

  final NavigatorService _navigatorService;

  void onTapMenuItem1() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S020Counter1PageShared()),
    );
  }

  void onTapMenuItem2() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S025Counter2PageShared()),
    );
  }

  void onTapMenuItem3() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S030CounterPageLocal()),
    );
  }

  void onTapMenuItem4() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S040MultiCounterPage()),
    );
  }

  void onTapMenuItem5() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S050ChangeNotifierCounterPage()),
    );
  }

  void onTapMenuItem6() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S060ChangeNotifiersCounterPage()),
    );
  }

  void onTapMenuItem7() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S070PropertyBuilderCounterPage()),
    );
  }

  void onTapMenuItem8() {
    _navigatorService.navigator.push(
      MaterialPageRoute(builder: (_) => const S080WatchCounterPage()),
    );
  }
}
