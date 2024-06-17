class Property<T> {
  Property(T initialValue, this._notifyListeners, [this.onValueChanged])
      : _value = initialValue;

  T _value;
  final void Function() _notifyListeners;
  void Function()? onValueChanged;

  T get value => _value;

  set value(T value) {
    if (_value != value) {
      _value = value;
      _notifyListeners();
      onValueChanged?.call();
    }
  }
}
