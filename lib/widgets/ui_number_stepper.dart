import 'dart:math';
import 'package:flutter/material.dart';

class UiNumberStepper extends StatefulWidget {
  final String unit;
  final double max;
  final double min;
  final double step;
  final bool disabeld;

  const UiNumberStepper({
    super.key,
    this.unit = "",
    this.min = 1.0,
    this.max = double.infinity,
    this.step = 1,
    this.disabeld = false,
  });

  @override
  State<UiNumberStepper> createState() => _UiNumberStepperState();
}

class _UiNumberStepperState extends State<UiNumberStepper> {
  late double _value;
  late FormFieldState<Object?> _field;

  @override
  void initState() {
    _value = widget.min;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disabeld,
      child: FormField(
        builder: (field) {
          _field = field;
          return Row(
            children: [
              IconButton(
                onPressed: decrease,
                icon: const Icon(Icons.remove),
              ),
              Text("$_value${widget.unit}"),
              IconButton(
                onPressed: increase,
                icon: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }

  decrease() {
    _value = min(_value + widget.step, widget.max);
    next();
  }

  increase() {
    _value = min(_value + widget.step, widget.max);
    next();
  }

  next() {
    _value = double.parse(_value.toStringAsFixed(2));
    _field.setValue(_value);
    setState(() {});
  }
}
