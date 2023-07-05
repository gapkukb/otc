import 'package:flutter/material.dart';
import 'package:otc/global/global.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class TextFormFieldEmail extends UiTextFormField {
  TextFormFieldEmail({
    super.key,
    super.formState,
    super.name,
    super.controller,
  }) : super(
          keyboardType: TextInputType.emailAddress,
          labelText: "邮箱地址",
          decoration: const InputDecoration(
            hintText: "eg:jack@gmail.com",
          ),
          validator: (value) {
            return global.regexp.email.hasMatch(value ?? "")
                ? null
                : "邮箱地址格式不正确";
          },
        );
}
