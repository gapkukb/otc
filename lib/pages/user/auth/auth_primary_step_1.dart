import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AuthPrimaryStep1 extends StatefulWidget {
  final Map<String, dynamic> formState;
  const AuthPrimaryStep1({
    super.key,
    required this.formState,
  });

  @override
  State<AuthPrimaryStep1> createState() => _AuthPrimaryStep1State();
}

class _AuthPrimaryStep1State extends State<AuthPrimaryStep1> {
  final formKey = GlobalKey<FormState>();
  static final idRegexp = RegExp(
      r"^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UiTextFormField(
          name: "name",
          formState: widget.formState,
          maxLength: 10,
          labelText: "法定姓名",
          validator: (value) {
            return (value == null || value.isEmpty) ? "法定姓名不能为空" : null;
          },
        ),
        const SizedBox(height: 16),
        UiTextFormField(
          labelText: "年龄",
          name: "age",
          formState: widget.formState,
          keyboardType: TextInputType.number,
          validator: (value) {
            return (value == null || value.isEmpty) ? "年龄不能为空" : null;
          },
        ),
        const Gap.small(),
        UiTextFormField(
          name: "identity",
          formState: widget.formState,
          maxLength: 18,
          labelText: "身份证号码",
          validator: (value) {
            if (value == null || value.length != 15 && value.length != 18) {
              return "身份证号码应为15或18位字符";
            }
            if (!idRegexp.hasMatch(value)) {
              return "身份证号码格式不正确";
            }

            return null;
          },
        ),
      ],
    );
  }
}
