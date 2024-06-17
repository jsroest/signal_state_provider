import 'package:flutter/material.dart';

class Property<T> extends ChangeNotifier {
  Property(T initialValue, [this.onValueChanged]) : _value = initialValue;

  T _value;
  void Function()? onValueChanged;

  T get value => _value;

  set value(T value) {
    if (_value != value) {
      _value = value;
      notifyListeners();
      onValueChanged?.call();
    }
  }
}
