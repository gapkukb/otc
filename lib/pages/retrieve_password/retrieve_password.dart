import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/utils/navigator.dart';
import 'package:otc/widgets/ui_button.dart';

class RetrievePassword extends StatelessWidget {
  RetrievePassword({super.key});

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 518,
            ),
            child: Card(
              clipBehavior: Clip.none,
              elevation: 20,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 64,
                  ),
                  child: SizedBox(
                    height: 360,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "重置登录密码",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 32),
                        const TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 1,
                          physics: NeverScrollableScrollPhysics(),
                          tabs: [
                            Tab(text: "邮箱"),
                            Tab(text: "手机"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 32.0,
                                ),
                                child: TextFormFieldEmail(
                                  formState: _formState,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 32.0,
                                ),
                                child: TextFormFieldPhone(
                                  formState: _formState,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 32),
                        UiButton(
                          label: "下一步",
                          fullWidth: true,
                          size: UiButtonSize.medium,
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;
                            await openCaptchaView(
                                context: context,
                                device: CaptchaDeviceType.email,
                                service: CaptchaServiceType.addAddressBook,
                                account: "test@af.cn");
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            child: const Text("返回登录"),
                            onPressed: () {
                              context.replace('/account/login');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
