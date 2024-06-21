import 'package:poc/pages/s010_main_menu/s010_main_menu_controller.dart';
import 'package:poc/pages/s020_shared_counter/shared_counter_state.dart';
import 'package:poc/services/navigator_service.dart';
import 'package:poc/state_provider/nested.dart';
import 'package:poc/state_provider/state_provider.dart';

List<SingleChildWidget> get controllers => [
      StateProvider((context) => SharedCounterState()),
      StateProvider(
        (context) =>
            S010MainMenuController(StateProvider.of<NavigatorService>(context)),
      ),
    ];
