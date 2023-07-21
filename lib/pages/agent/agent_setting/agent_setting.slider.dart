import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_slider.dart';

class AgentSettingSlider extends StatefulWidget {
  final bool? disabled;
  final double value;
  final double max;
  final double min;
  final String name;
  const AgentSettingSlider({
    super.key,
    this.disabled,
    this.max = 2.5,
    this.min = 0.5,
    required this.value,
    required this.name,
  });

  @override
  State<AgentSettingSlider> createState() => _AgentSettingSliderState();
}

class _AgentSettingSliderState extends State<AgentSettingSlider> {
  late double value;
  @override
  void initState() {
    value = widget.min;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UISlider(
        value: value,
        min: widget.min,
        max: widget.max,
        name: widget.name,
        divisions: 100,
        onChanged: widget.disabled == true
            ? null
            : (val) {
                setState(() {
                  value = double.parse(val.toStringAsExponential(2));
                });
              });
  }
}
