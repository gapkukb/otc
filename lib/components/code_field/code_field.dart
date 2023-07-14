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
  final String? label;
  final TextEditingController? textController;
  final CountdownTimerController? controller;

  final FutureOr Function()? onPressed;

  const CodeField({
    super.key,
    this.maxLength = 6,
    this.onPressed,
    this.textController,
    this.controller,
    this.type = CodeFieldType.phone,
    this.target = "",
    this.label,
  });

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  bool isRunning = false;
  bool isFirstTime = true;
  late TextEditingController controller;

  get disabled {
    return isRunning || (widget.target == "");
  }

  onEnd() {
    if (mounted) {
      setState(() {
        isRunning = false;
      });
    }
  }

  @override
  void initState() {
    controller = widget.textController ?? TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      autofocus: true,
      controller: widget.textController,
      maxLength: widget.maxLength,
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
      decoration: InputDecoration(
        label: Text(widget.label ?? "请输入${widget.maxLength.toString()}位数验证码"),
        border: const OutlineInputBorder(),
        suffixIcon: CountdownButton(
          controller: widget.controller,
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
