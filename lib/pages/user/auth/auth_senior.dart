import 'package:flutter/material.dart';
import 'package:otc/pages/components/user_modal_page_template/user_modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:intl/intl.dart';

class AuthSenior extends StatefulWidget {
  const AuthSenior({super.key});

  @override
  State<AuthSenior> createState() => _AuthSeniorState();
}

class _AuthSeniorState extends State<AuthSenior> {
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
    return UserModalPageTemplate(
      legend: "身份认证",
      title: "姓名年龄认证",
      onCompelete: () {},
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
