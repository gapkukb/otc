import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  bool _showEmail = true;

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
              "登录",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              tabs: const [
                Tab(
                  text: "邮箱登录",
                ),
                Tab(
                  text: "手机登录",
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
                          name: "username",
                          formState: _formState,
                        )
                      : TextFormFieldPhone(
                          name: "username",
                          formState: _formState,
                        ),
                  const SizedBox(height: 32),
                  TextFormFieldPassword(
                    formState: _formState,
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    fullWidth: true,
                    size: UiButtonSize.medium,
                    label: "登录",
                    onPressed: login,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UiButton(
                        variant: UiButtonVariant.text,
                        onPressed: () {
                          context.go("/account/register");
                        },
                        label: "免费注册",
                      ),
                      UiButton(
                        variant: UiButtonVariant.text,
                        onPressed: () {
                          context.pushNamed(Routes.resetPwd);
                        },
                        label: "忘记密码",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await ref.read(userProvider.notifier).login(
            username: _formState['username'],
            password: _formState['password'],
          );
      if (mounted) Navigator.of(context).maybePop();
      GoRouter.of(navigatorKey.currentContext!).replace('/');
    }
  }
}
