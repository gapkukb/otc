import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class TextFormFieldInviteCode extends StatelessWidget {
  final TextEditingController? controller;
  const TextFormFieldInviteCode({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      labelText: "邀请码",
      maxLength: 6,
      name: "invite_code",
      validator: (value) {
        if (value!.isEmpty) {
          return "请填写邀请码";
        }
        return null;
      },
    );
  }
}
