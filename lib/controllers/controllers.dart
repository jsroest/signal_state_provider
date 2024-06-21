import 'package:poc/pages/s010_main_menu/s010_main_menu_controller.dart';
import 'package:poc/pages/s020_shared_counter/s020_counter_1/s020_counter_1_controller.dart';
import 'package:poc/pages/s020_shared_counter/s025_counter_2/s025_counter_2_controller.dart';
import 'package:poc/pages/s020_shared_counter/shared_counter_state.dart';
import 'package:poc/pages/s040_multi_counter/s040_multi_counter_controller.dart';
import 'package:poc/pages/s050_change_notifier_counter/s050_change_notifier_counter_controller.dart';
import 'package:poc/pages/s060_change_notifiers_counter/s060_change_notifiers_counter_controller.dart';
import 'package:poc/pages/s070_property_builder_counter/s070_property_builder_counter_controller.dart';
import 'package:poc/pages/s080_watch_counter/s080_watch_counter_controller.dart';
import 'package:poc/services/navigator_service.dart';
import 'package:poc/state_provider/nested.dart';
import 'package:poc/state_provider/state_provider.dart';

List<SingleChildWidget> get controllers => [
      StateProvider((context) => SharedCounterState()),
      StateProvider(
        (context) => S010MainMenuController(
          StateProvider.of<NavigatorService>(context),
        ),
      ),
      StateProvider(
        (context) => S020Counter1Controller(
          StateProvider.of<SharedCounterState>(context),
        ),
      ),
      StateProvider(
        (context) => S025Counter2Controller(
          StateProvider.of<SharedCounterState>(context),
        ),
      ),
      StateProvider(
        (context) => S040MultiCounterController(),
      ),
      StateProvider(
        (context) => S050ChangeNotifierCounterController(),
      ),
      StateProvider(
        (context) => S060ChangeNotifiersCounterController(),
      ),
      StateProvider(
        (context) => S070PropertyBuilderCounterController(),
      ),
      StateProvider(
        (context) => S080WatchCounterController(),
      ),
    ];
