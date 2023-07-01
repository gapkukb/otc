import 'package:flutter/material.dart';
import 'package:otc/globals/globals.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class TextFormFieldPassword extends StatelessWidget {
  final TextEditingController? controller;
  const TextFormFieldPassword({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      obscureText: true,
      maxLines: 1,
      labelText: "密码",
      validator: (value) {
        return globals.regexp.password.hasMatch(value ?? "")
            ? null
            : "请输入8-16位字符";
      },
    );
  }
}
