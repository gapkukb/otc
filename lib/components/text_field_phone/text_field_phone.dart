import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_text_field.dart';

class TextFieldPhone extends StatelessWidget {
  String code = "+86";
  final TextEditingController controller;

  TextFieldPhone({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return UiTextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "手机",
        hintText: "请输入手机号码",
        prefixIcon: MouseRegion(
          cursor: SystemMouseCursors.grab,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              print("object");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(code),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
