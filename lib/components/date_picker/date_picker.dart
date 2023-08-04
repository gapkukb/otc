import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/date_time.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatefulWidget {
  final DateTime? value;
  final DateTime? maxDate;
  final DateTime? minDate;
  final DateTime? initDate;
  final String labelText;
  final String? Function(String? value)? validator;
  final String? name;
  final Map<String, dynamic>? formState;

  const DatePicker({
    super.key,
    this.initDate,
    this.maxDate,
    this.minDate,
    this.value,
    this.labelText = "请选择日期",
    this.validator,
    this.formState,
    this.name,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateRangePickerController controller;

  @override
  void initState() {
    controller = DateRangePickerController();
    if (widget.initDate != null) {
      _setValue(dateFormatter.format(widget.initDate!));
    }
    super.initState();
  }

  String? text;

  _setValue(String? newValue) {
    if (widget.name != null) {
      widget.formState?.update(
        widget.name!,
        (value) => text,
        ifAbsent: () => text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: widget.validator,
      onSaved: _setValue,
      builder: (field) {
        return GestureDetector(
          onTap: () async {
            String value = await showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      color: Colors.white,
                      width: 360,
                      height: 360,
                      child: SfDateRangePicker(
                        controller: DateRangePickerController(),
                        minDate: widget.minDate,
                        maxDate: widget.maxDate,
                        initialDisplayDate: widget.initDate,
                        showTodayButton: true,
                        showActionButtons: true,
                        cancelText: "取消",
                        confirmText: "确定",
                        onCancel: () {},
                        onSelectionChanged: (dateTime) {
                          final value = dateFormatter.format(dateTime.value as DateTime);
                          text = value;
                          Navigator.of(context, rootNavigator: true).pop(value);
                          field.setState(() {
                            field.setValue(value);
                            field.validate();
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: SizedBox(
            height: 56,
            width: 150,
            child: InputDecorator(
                isEmpty: text == null,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    labelText: widget.labelText,
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined)),
                child: Text(
                  text ?? "",
                  style: Font.medium,
                )),
          ),
        );
      },
    );
  }
}
