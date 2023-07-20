import 'package:flutter/material.dart';

class UISlider extends FormField {
  final String? name;
  final Map<String, dynamic>? formState;
  final double value;
  final void Function(double value)? onChanged;
  final double max;
  final double min;
  final int? divisions;

  UISlider({
    super.key,
    this.name,
    this.formState,
    super.autovalidateMode,
    super.enabled,
    super.initialValue,
    super.restorationId,
    super.validator,
    required this.value,
    required this.onChanged,
    this.divisions = 1,
    this.max = 100,
    this.min = 0,
  }) : super(onSaved: (value) {
          if (name != null) {
            formState?.update(name, (value) => value, ifAbsent: () => value);
          }
        }, builder: (formFieldState) {
          return Slider(
            max: max,
            min: min,
            divisions: divisions,
            value: value,
            label: value.toString(),
            onChanged: onChanged,
          );
        });
}
