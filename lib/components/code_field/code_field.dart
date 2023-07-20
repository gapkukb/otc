import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:otc/components/countdown_button/countdown_button.dart';
import 'package:otc/widgets/ui_button.dart';
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
  final String? name;
  final Map<String, dynamic>? formState;
  final FutureOr<bool?> Function()? onPressed;
  final String? Function(String?)? validator;
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
    this.formState,
    this.name,
    this.validator,
  });

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  late TextEditingController _controller;
  paste() async {
    final code = await FlutterClipboard.paste();
    _controller.text = code;
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.textController ?? TextEditingController();
  }

  @override
  dispose() {
    if (widget.textController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      autofocus: widget.autofocus,
      controller: widget.textController,
      maxLength: widget.maxLength,
      name: widget.name,
      formState: widget.formState,
      validator: widget.validator,
      keyboardType: widget.onlyNumber
          ? const TextInputType.numberWithOptions(decimal: false)
          : null,
      decoration: InputDecoration(
          label: Text(
              widget.labelText ?? "请输入${widget.maxLength.toString()}位数验证码"),
          border: const OutlineInputBorder(),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              UiButton.text(
                label: "粘贴",
                minWidth: 60,
                onPressed: paste,
              ),
              CountdownButton(
                disabled: widget.disabled,
                controller: widget.controller,
                onPressed: widget.onPressed,
              ),
            ],
          )),
    );
  }
}
