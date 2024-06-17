import 'package:poc/property_builder/property.dart';

class S070PropertyBuilderCounterController {
  late final counter1 = Property(0);
  late final counter2 = Property(0);
  late final counter3 = Property(0);

  void incrementCounter1Pressed() {
    counter1.value++;
  }

  void incrementCounter2Pressed() {
    counter2.value++;
  }

  void incrementCounter3Pressed() {
    counter3.value++;
  }
}
