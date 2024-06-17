import 'package:flutter/material.dart';
import 'package:poc/pages/s020_shared_counter/s020_counter_1/s020_counter_1_page.dart';
import 'package:poc/pages/s020_shared_counter/s025_counter_2/s025_counter_2_page.dart';
import 'package:poc/pages/s030_local_counter/s030_counter_page.dart';
import 'package:poc/pages/s040_multi_counter/s040_multi_counter_page.dart';
import 'package:poc/pages/s050_change_notifier_counter/s050_change_notifier_counter_page.dart';

class S010MainMenuController {
  S010MainMenuController(this.navigator);

  final NavigatorState navigator;

  void onTapMenuItem1() {
    navigator.push(
      MaterialPageRoute(builder: (_) => const S020Counter1PageShared()),
    );
  }

  void onTapMenuItem2() {
    navigator.push(
      MaterialPageRoute(builder: (_) => const S025Counter2PageShared()),
    );
  }

  void onTapMenuItem3() {
    navigator.push(
      MaterialPageRoute(builder: (_) => const S030CounterPageLocal()),
    );
  }

  void onTapMenuItem4() {
    navigator.push(
      MaterialPageRoute(builder: (_) => const S040MultiCounterPage()),
    );
  }

  void onTapMenuItem5() {
    navigator.push(
      MaterialPageRoute(builder: (_) => const S050ChangeNotifierCounterPage()),
    );
  }
}
