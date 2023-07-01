import 'package:flutter/material.dart';
import 'package:otc/globals/globals.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class TextFormFieldEmail extends StatelessWidget {
  final TextEditingController? controller;
  const TextFormFieldEmail({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      keyboardType: TextInputType.emailAddress,
      labelText: "邮箱地址",
      decoration: const InputDecoration(
        hintText: "eg:jack@gmail.com",
      ),
      validator: (value) {
        return globals.regexp.email.hasMatch(value ?? "") ? null : "请输入正确的邮箱地址";
      },
    );
  }
}
