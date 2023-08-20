import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gap/gap.dart';
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

class _LoginState extends ConsumerState<Login> with SingleTickerProviderStateMixin {
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
    return UnconstrainedBox(
      child: SizedBox(
        width: 500,
        child: Card(
          elevation: 10,
          borderOnForeground: true,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: Text(
                        "登录",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      right: -12,
                      top: -12,
                      width: 48,
                      height: 48,
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.close_outlined),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  tabs: const [
                    Tab(
                      text: "邮箱",
                    ),
                    Tab(
                      text: "手机",
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap.xlarge(),
                      _showEmail
                          ? TextFormFieldEmail(
                              name: "username",
                              formState: _formState,
                            )
                          : TextFormFieldPhone(
                              name: "username",
                              formState: _formState,
                            ),
                      const Gap.medium(),
                      TextFormFieldPassword(
                        formState: _formState,
                        onFieldSubmitted: (_) {
                          login();
                        },
                      ),
                      const SizedBox(height: 86),
                      UiButton(
                        fullWidth: true,
                        size: UiButtonSize.large,
                        label: "登录",
                        onPressed: login,
                      ),
                      const Gap.small(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UiButton(
                            variant: UiButtonVariant.text,
                            onPressed: () {
                              context.pushReplacementNamed(Routes.register);
                            },
                            label: "免费注册",
                          ),
                          UiButton(
                            variant: UiButtonVariant.text,
                            onPressed: () {
                              context.pushReplacementNamed(Routes.resetPwd);
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
      GoRouter.of(context).go(Routes.home);
    }
  }
}
