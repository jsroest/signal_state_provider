import 'package:flutter/material.dart';
import 'package:poc/property_builder/property.dart';

class PropertyBuilder<T> extends StatelessWidget {
  const PropertyBuilder({
    super.key,
    required this.property,
    required this.builder,
    this.child,
  });

  final Property<T> property;
  final Widget Function(
    BuildContext context,
    T value,
  ) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: property,
      builder: (context, _) => builder(
        context,
        property.value,
      ),
      child: child,
    );
  }
}
