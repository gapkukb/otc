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
      name: "invitationCode",
      validator: (value) {
        if (value!.isEmpty || value.length < 6) {
          return "邀请码格式不正确，必须是6位字符";
        }
        return null;
      },
    );
  }
}
