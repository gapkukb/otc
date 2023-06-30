import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/text_field_phone/text_field_phone.dart';
import 'package:otc/widgets/ui_text_field.dart';

class RegisterMain extends StatefulWidget {
  const RegisterMain({super.key});

  @override
  State<RegisterMain> createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain>
    with SingleTickerProviderStateMixin {
  int _selectedTabbar = 0;

  final _controller = TextEditingController();

  late bool _showClearButton;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setClearButton() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UiTextField(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "邮箱",
            hintText: "请输入邮箱",
          ),
        ),
        const SizedBox(height: 24),
        TextFieldPhone(controller: TextEditingController()),
        const SizedBox(height: 24),
        const UiTextField(
          maxLength: 16,
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "请输入8-16位密码，必须同时包含大小写字母和数字以及特殊符号",
          ),
          // inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          obscureText: true,
        ),
        const SizedBox(height: 24),
        const UiTextField(
          // controller: _controller,
          keyboardType: TextInputType.number,
          maxLength: 6,
          decoration: InputDecoration(
            labelText: "邀请码",
            hintText: "请输入6位数字邀请码",
            counterText: "",
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Checkbox(value: true, onChanged: (checked) {}),
            Text.rich(
              TextSpan(
                text: '我已经阅读并且同意',
                children: [
                  TextSpan(
                    text: 'Mybit使用条款',
                    style: const TextStyle(
                      color: Color(0xff7951F9),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Privacy Policy"');
                      },
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton(
            onPressed: () {},
            child: const Text("注册"),
          ),
        ),
        const SizedBox(height: 24),
        Text.rich(
          TextSpan(
            text: '已有账号？',
            children: [
              TextSpan(
                text: '登录',
                style: const TextStyle(
                  color: Color(0xff7951F9),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.replace("/login");
                  },
              ),
            ],
          ),
        )
      ],
    );
  }
}
