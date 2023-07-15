import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:otc/components/countdown_button/countdown_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

enum CodeFieldType { phone, email, f2a }

class CodeField extends StatefulWidget {
  final CodeFieldType type;
  final String target;
  final int maxLength;
  final String? labelText;
  final bool onlyNumber;
  final bool autofocus;
  final bool disabled;
  final TextEditingController? textController;
  final CountdownTimerController? controller;

  final FutureOr<bool> Function()? onPressed;

  const CodeField({
    super.key,
    this.maxLength = 6,
    this.onPressed,
    this.textController,
    this.controller,
    this.type = CodeFieldType.phone,
    this.target = "",
    this.labelText,
    this.onlyNumber = true,
    this.autofocus = true,
    this.disabled = true,
  });

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      autofocus: widget.autofocus,
      controller: widget.textController,
      maxLength: widget.maxLength,
      keyboardType: widget.onlyNumber
          ? const TextInputType.numberWithOptions(decimal: false)
          : null,
      decoration: InputDecoration(
        label:
            Text(widget.labelText ?? "请输入${widget.maxLength.toString()}位数验证码"),
        border: const OutlineInputBorder(),
        suffixIcon: CountdownButton(
          disabled: widget.disabled,
          controller: widget.controller,
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
