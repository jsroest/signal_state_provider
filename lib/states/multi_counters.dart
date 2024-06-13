import 'package:poc/states/counter_state.dart';

/*
When you use StateProvider.of<T>, the type T is used to find the instance of
this type in the widget tree. It is not possible to look up multiple instances
of exact the same type. The classes below make it possible to use a type more
than once by introducing a different type for each instance.
 */

class MultiCounter1 extends CounterState {
  MultiCounter1({super.debugLabel});
}

class MultiCounter2 extends CounterState {
  MultiCounter2({super.debugLabel});
}

class MultiCounter3 extends CounterState {
  MultiCounter3({super.debugLabel});
}
