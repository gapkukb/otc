import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_invite_code/text_form_field_invite_code.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/utils/navigator.dart';
import './register_success.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  bool _showEmail = true;
  bool _agreement = false;
  bool _successful = false;
  double rate = 0.0;

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
    return UnconstrainedBox(
      child: SizedBox(
        width: 500,
        child: Card(
          elevation: 10,
          borderOnForeground: true,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: _successful
                ? RegisterSuccess(
                    rate: rate,
                  )
                : _buildBody(),
          ),
        ),
      ),
    );
  }

  _buildBody() {
    return Column(
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
              const Gap.small(),
              _showEmail
                  ? TextFormFieldEmail(
                      name: "account",
                      formState: _formState,
                    )
                  : TextFormFieldPhone(
                      name: "account",
                      formState: _formState,
                    ),
              const Gap.small(),
              TextFormFieldPassword(
                formState: _formState,
              ),
              const Gap.small(),
              TextFormFieldInviteCode(
                formState: _formState,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _agreement,
                    onChanged: (checked) {
                      setState(() {
                        _agreement = checked!;
                      });
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      text: '我已经阅读并且同意',
                      children: [
                        TextSpan(
                          text: 'Maoerduo使用条款',
                          style: const TextStyle(
                            color: Color(0xff7951F9),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.replace(Routes.terms);
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              UiButton(
                fullWidth: true,
                size: UiButtonSize.large,
                label: "注册",
                onPressed: register,
              ),
              const Gap.small(),
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
                          context.pushReplacementNamed(Routes.login);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  register() async {
    var device = _showEmail ? CaptchaDevice.email : CaptchaDevice.phone;

    if (_formKey.currentState!.validate()) {
      if (!_agreement) {
        Modal.showText(text: "请阅读并同意使用条款");
        return;
      }

      _formKey.currentState!.save();

      var result = await openCaptchaWindow(CaptchaWindowOptions(
        context: context,
        preferredDevice: device,
        session: CaptchaSession.register,
        account: _formState['account'],
        switchable: false,
      ));
      if (result == null) return;
      var payload = {
        "device": device.value,
        ...result,
        ..._formState,
      };
      await apis.user.register(payload);
      await provider.read(userProvider.notifier).login(
            username: _formState['account'],
            password: _formState['password'],
          );
      setState(() {
        _successful = true;
      });
    }
  }
}
