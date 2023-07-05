import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/widgets/ui_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 64,
                ),
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
                    const SizedBox(height: 32),
                    const SizedBox(
                      height: 200,
                      child: TabBody(),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        child: const Text("返回登录"),
                        onPressed: () {
                          context.ba
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
    );
  }
}

class TabBody extends StatelessWidget {
  const TabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormFieldEmail(),
            const SizedBox(
              height: 86,
            ),
            UiButton(
              fullWidth: true,
              size: UiButtonSize.medium,
              onPressed: () {
                // Navigator.of(context).push(
                //   PageRouteBuilder(
                //     opaque: false,
                //     pageBuilder: (BuildContext context, _, __) =>
                //         UserPhoneVerification(),
                //   ),
                // );
                context.push('/bind_f2a');
              },
              label: "下一步",
            ),
          ],
        ),
        Column(
          children: [
            const TextFormFieldPhone(),
            const SizedBox(
              height: 86,
            ),
            UiButton(
              fullWidth: true,
              size: UiButtonSize.medium,
              onPressed: () {
                // Navigator.of(context).push(
                //   PageRouteBuilder(
                //     opaque: false,
                //     pageBuilder: (BuildContext context, _, __) =>
                //         UserPhoneVerification(),
                //   ),
                // );
                context.push('/bind_f2a');
              },
              label: "下一步",
            ),
          ],
        ),
      ],
    );
  }
}
