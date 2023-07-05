import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:timer_count_down/timer_count_down.dart';

enum CodeFieldType { phone, email, f2a }

class CodeField extends StatefulWidget {
  final CodeFieldType type;
  final String target;
  final int maxLength;
  final String? label;
  late TextEditingController? controller;

  final Function()? onCompelete;

  CodeField({
    super.key,
    this.maxLength = 6,
    this.onCompelete,
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
    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UiTextField(
      autofocus: true,
      controller: widget.controller,
      maxLength: widget.maxLength,
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
      decoration: InputDecoration(
        label: Text(widget.label ?? "请输入${widget.maxLength.toString()}位数验证码"),
        border: const OutlineInputBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: MaterialButton(
            minWidth: 102,
            disabledColor: Colors.grey.shade500,
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: disabled
                ? null
                : () {
                    setState(() {
                      isRunning = true;
                      isFirstTime = false;
                    });
                  },
            child: Countdown(
              key: ValueKey(isRunning),
              seconds: 2,
              build: (BuildContext context, double time) {
                String text;

                if (isRunning) {
                  text = '剩余${time.toInt().toString()}秒';
                } else if (isFirstTime) {
                  text = "获取验证码";
                } else {
                  text = "重新获取";
                }

                return Text(
                  text,
                  style: const TextStyle(fontSize: 16),
                );
              },
              onFinished: () {
                setState(() {
                  isRunning = false;
                });
                widget.onCompelete?.call();
              },
            ),
          ),
        ),
      ),
    );
  }
}
