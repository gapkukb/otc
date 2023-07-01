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
    return const UiTextFormField(
      labelText: "邀请码(选填)",
      maxLength: 6,
    );
  }
}
