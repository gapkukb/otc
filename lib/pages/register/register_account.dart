import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_invite_code/text_form_field_invite_code.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/widgets/ui_button.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  bool _showEmail = true;
  bool _agreement = false;

  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(_toggle);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_toggle);
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    _showEmail = _controller.index == 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "注册账号",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              tabs: const [
                Tab(
                  text: "邮箱注册",
                ),
                Tab(
                  text: "手机注册",
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 32),
                  _showEmail
                      ? TextFormFieldEmail(
                          name: "email",
                          formState: _formState,
                        )
                      : const TextFormFieldPhone(),
                  const SizedBox(height: 32),
                  const TextFormFieldPassword(),
                  const SizedBox(height: 32),
                  const TextFormFieldInviteCode(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _agreement,
                        onChanged: (checked) {
                          _agreement = checked!;
                          setState(() {});
                        },
                      ),
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
                                  context.push('/terms');
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    fullWidth: true,
                    label: "注册",
                    onPressed: register,
                  ),
                  const SizedBox(height: 16),
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
                              context.go("/login");
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  register() async {
    var code = await context.push(
      '/email_verification',
      extra: {
        "email": _formState['username'],
      },
    ) as String;

    inspect(code);

    // if (_formKey.currentState!.validate()) {
    //   if (!_agreement) {
    //     Modal.showText(text: "请阅读并同意使用条款");
    //     return;
    //   }
    //   _formKey.currentState!.save();
    //   await context.push('/email_verification');
    //   // await apis.user.register(_formState);
    //   // await context.push('/register_validation');
    //   // Modal.showText(text: "注册成功");
    // }
  }
}
