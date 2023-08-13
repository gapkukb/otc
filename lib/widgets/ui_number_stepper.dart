import 'dart:math';
import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';

class UiNumberStepper extends StatefulWidget {
  final String unit;
  final String? name;
  final double max;
  final double min;
  final double step;
  final double? initValue;
  final bool disabeld;
  final bool? isDense;
  final Map<String, dynamic>? formState;
  final Function(double newValue)? onChange;

  const UiNumberStepper({
    super.key,
    this.unit = "",
    this.min = 1.0,
    this.max = double.infinity,
    this.step = 1,
    this.disabeld = false,
    this.isDense,
    this.initValue,
    this.onChange,
    this.name,
    this.formState,
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
        onSaved: (__) {
          if (widget.name != null) {
            widget.formState?.update(
              widget.name!,
              (_) => _value,
              ifAbsent: () => _value,
            );
          }
        },
        builder: (field) {
          _field = field;
          return InputDecorator(
            decoration: InputDecoration(
              enabled: !widget.disabeld,
              isDense: widget.isDense,
              filled: widget.disabeld,
              fillColor: Colors.grey.shade100.withOpacity(0.6),
              prefixIcon: IconButton(
                onPressed: decrease,
                icon: Icon(
                  Icons.remove,
                  color: Colors.black.withAlpha(200),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: increase,
                icon: const Icon(Icons.add),
              ),
              border: const OutlineInputBorder(),
            ),
            child: Text(
              "$_value${widget.unit}",
              style: widget.disabeld == true ? Font.mediumGrey : Font.medium,
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
      widget.onChange?.call(_value);
    });
  }
}
