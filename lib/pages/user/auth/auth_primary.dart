import 'package:flutter/material.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:intl/intl.dart';

class AuthPrimary extends StatefulWidget {
  const AuthPrimary({super.key});

  @override
  State<AuthPrimary> createState() => _AuthPrimaryState();
}

class _AuthPrimaryState extends State<AuthPrimary> {
  DateTime _dateTime = DateTime.now();
  late TextEditingController _controller;

  get _dateTimeText {
    return DateFormat('yyyy-MM-dd').format(_dateTime);
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  FocusNode myfocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "身份认证",
      title: "初级认证",
      onCompelete: (_) {},
      children: [
        UiTextField(
          autofocus: true,
          label: "法定姓名",
        ),
        const SizedBox(height: 16),
        UiTextField(
          label: "出生日期",
          controller: _controller,
          decoration: InputDecoration(
            hintText: "例如：${DateTime.now().toString().substring(0, 10)}",
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () async {
                var dateTime = await showDatePicker(
                  context: context,
                  initialDate: _dateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  useRootNavigator: true,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                );
                debugPrint(dateTime.toString());
                if (dateTime != null) {
                  setState(() {
                    _dateTime = dateTime;
                    _controller.text = _dateTimeText;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
