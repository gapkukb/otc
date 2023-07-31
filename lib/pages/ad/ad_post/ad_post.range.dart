part of ad_post;

class AdPostRange extends StatefulWidget {
  final double initValue;
  final double max;
  final double min;
  final String? name;
  final Map<String, dynamic>? formState;
  final String? Function(RangeValues?)? validator;

  const AdPostRange({
    super.key,
    this.initValue = 0,
    this.max = 100,
    this.min = 0,
    this.name,
    this.formState,
    this.validator,
  });

  @override
  State<AdPostRange> createState() => _AdPostRangeState();
}

class _AdPostRangeState extends State<AdPostRange> {
  late double startValue;
  late double endValue;
  late double value;
  int typeIndex = 0;

  @override
  void initState() {
    startValue = max(widget.initValue, widget.min);
    endValue = min(widget.initValue, widget.max);
    value = min(max(widget.initValue, widget.min), widget.max);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AdPostRange oldWidget) {
    super.didUpdateWidget(oldWidget);
    startValue = max(widget.initValue, widget.min);
    endValue = min(widget.initValue, widget.max);
    value = min(max(widget.initValue, widget.min), widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(),
        typeIndex == 0 ? buildSingle() : buildRange(),
      ],
    );
  }

  Widget buildRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: RadioListTile<int>(
            title: const Text("固定价格"),
            contentPadding: EdgeInsets.zero,
            value: 0,
            groupValue: typeIndex,
            onChanged: onChanged,
          ),
        ),
        Flexible(
          child: RadioListTile<int>(
            title: const Text("浮动价格"),
            value: 1,
            groupValue: typeIndex,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildRange() {
    return FormField(
      onSaved: onSaved,
      builder: (field) {
        return RangeSlider(
          max: widget.max,
          min: widget.min,
          divisions: 100,
          values: RangeValues(startValue, endValue),
          labels: RangeLabels(startValue.toStringAsFixed(2), endValue.toStringAsFixed(2)),
          onChanged: (value) {
            setState(() {
              startValue = value.start;
              endValue = value.end;
            });
          },
        );
      },
      validator: widget.validator,
    );
  }

  Widget buildSingle() {
    return FormField(
      onSaved: onSaved,
      builder: (field) {
        return SliderTheme(
          data: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: Slider(
            max: widget.max,
            min: widget.min,
            divisions: 100,
            value: value,
            label: value.toStringAsFixed(2),
            onChanged: (val) {
              setState(() {
                value = val;
              });
            },
          ),
        );
      },
      validator: widget.validator,
    );
  }

  onSaved(newValue) {
    if (widget.name != null) {
      widget.formState?.update(widget.name!, (value) => value, ifAbsent: () => value);
    }
  }

  onChanged(int? value) {
    setState(() {
      typeIndex = value ?? 0;
    });
  }
}
