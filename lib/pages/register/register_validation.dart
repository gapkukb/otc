import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_invite_code/text_form_field_invite_code.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/widgets/ui_button.dart';

class RegisterValidation extends StatefulWidget {
  const RegisterValidation({super.key});

  @override
  State<RegisterValidation> createState() => _RegisterValidationState();
}

class _RegisterValidationState extends State<RegisterValidation>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _showEmail = true;
  late TabController _controller;

  String _username = "";
  String _password = "";
  String _invitationCode = "";

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
                  text: "邮箱注册222",
                ),
                Tab(
                  text: "手机注册222",
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
                      ? const TextFormFieldEmail()
                      : const TextFormFieldPhone(),
                  const SizedBox(height: 32),
                  const TextFormFieldPassword(),
                  const SizedBox(height: 32),
                  const TextFormFieldInviteCode(),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  UiButton(
                    fullWidth: true,
                    label: "注册",
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      await context.push('/slider_captcha');

                      Modal.showText(text: "注册成功");
                      // }
                    },
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
}
