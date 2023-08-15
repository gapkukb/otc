part of ad_post;

class AdPostRange extends StatefulWidget {
  final double rate;
  final String? name;
  final Map<String, dynamic> formState;
  final String? Function(RangeValues?)? validator;

  const AdPostRange({
    super.key,
    this.rate = 0,
    this.name,
    this.validator,
    required this.formState,
  });

  @override
  State<AdPostRange> createState() => _AdPostRangeState();
}

class _AdPostRangeState extends State<AdPostRange> {
  late double value;
  int typeIndex = 0;

  @override
  void initState() {
    value = widget.rate;
    saveFlag();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AdPostRange oldWidget) {
    super.didUpdateWidget(oldWidget);
    value = widget.rate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(),
        typeIndex == 0
            ? buildSingle(
                widget.rate + 0.1,
                widget.rate - 0.1,
                widget.rate,
              )
            : buildSingle(0.1, -0.1, 0),
        if (typeIndex == 0) const Text("固定价格的范围在参考价格的±0.1，固定价格一旦设定后，不会改变", style: Font.miniGrey),
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

  Widget buildSingle(double max, double min, double initValue) {
    return FormField(
      key: ValueKey(typeIndex),
      onSaved: onSaved,
      builder: (field) {
        return UiNumberStepper(
          max: max,
          min: min,
          step: 0.01,
          initValue: initValue,
          onChange: (newValue) {
            value = newValue;
          },
        );
      },
      validator: widget.validator,
    );
  }

  onSaved(newValue) {
    double val = 0.0;

    if (widget.name != null) {
      if (typeIndex == 0) {
        val = value - widget.rate;
      } else {
        val = value;
      }
      print(val);
      val = val.toFixed().toDouble();
      widget.formState.update(widget.name!, (_) => val, ifAbsent: () => val);
    }
  }

  saveFlag() {
    widget.formState.update(
      "fixedRate",
      (_) => typeIndex == 0,
      ifAbsent: () => typeIndex == 0,
    );
  }

  onChanged(int? value) {
    setState(() {
      typeIndex = value ?? 0;
      saveFlag();
    });
  }
}
