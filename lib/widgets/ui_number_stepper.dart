import 'dart:math';
import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';

class UiNumberStepper extends StatefulWidget {
  final String unit;
  final double max;
  final double min;
  final double step;
  final double? initValue;
  final bool disabeld;
  final Function(double newValue) onChange;

  const UiNumberStepper({
    super.key,
    this.unit = "",
    this.min = 1.0,
    this.max = double.infinity,
    this.step = 1,
    this.disabeld = false,
    this.initValue,
    required this.onChange,
  });

  @override
  State<UiNumberStepper> createState() => _UiNumberStepperState();
}

class _UiNumberStepperState extends State<UiNumberStepper> {
  late double _value;
  late FormFieldState<Object?> _field;

  @override
  void initState() {
    _value = widget.initValue ?? widget.min;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disabeld,
      child: FormField(
        builder: (field) {
          _field = field;
          return InputDecorator(
            decoration: InputDecoration(
              // constraints: const BoxConstraints(
              //   minHeight: 56,
              //   maxHeight: 56,
              // ),
              prefixIcon: IconButton(
                onPressed: decrease,
                icon: const Icon(Icons.remove),
              ),
              suffixIcon: IconButton(
                onPressed: increase,
                icon: const Icon(Icons.add),
              ),
              border: const OutlineInputBorder(),
            ),
            child: Text(
              "$_value${widget.unit}",
              style: Font.medium,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  decrease() {
    _value = max(_value - widget.step, widget.min);
    next();
  }

  increase() {
    _value = min(_value + widget.step, widget.max);
    next();
  }

  next() {
    _value = double.parse(_value.toStringAsFixed(2));
    _field.setValue(_value);
    setState(() {
      widget.onChange(_value);
    });
  }
}
