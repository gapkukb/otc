import 'package:flutter/material.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:intl/intl.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class AuthPrimary extends StatefulWidget {
  const AuthPrimary({super.key});

  @override
  State<AuthPrimary> createState() => _AuthPrimaryState();
}

class _AuthPrimaryState extends State<AuthPrimary> {
  final Map<String, dynamic> formState = {};
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
  static final regexp = RegExp(
      r"^(?:(?:1[6-9]|[2-9][0-9])[0-9]{2}([-/.]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:(?:1[6-9]|[2-9][0-9])(?:0[48]|[2468][048]|[13579][26])|(?:16|[2468][048]|[3579][26])00)([-/.]?)0?2\2(?:29))$");
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ModalPageTemplate(
        legend: "身份认证",
        title: "初级认证",
        onCompelete: (_) {},
        children: [
          UiTextFormField(
            name: "name",
            formState: formState,
            maxLength: 10,
            labelText: "法定姓名",
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            labelText: "出生日期",
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
            validator: (value) {
              if (!regexp.hasMatch(value!)) {
                return "日期格式不正确";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
