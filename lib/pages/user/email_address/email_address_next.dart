import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/user_modal_page_template/user_modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';

class UserEmailAddressNext extends StatefulWidget {
  const UserEmailAddressNext({super.key});

  @override
  State<UserEmailAddressNext> createState() => _UserEmailAddressNextState();
}

class _UserEmailAddressNextState extends State<UserEmailAddressNext> {
  final _controller = TextEditingController();

  String uname = "abc";

  @override
  Widget build(BuildContext context) {
    return UserModalPageTemplate(
      title: "修改邮箱",
      nextText: "完成",
      onCompelete: () async {
        BotToast.showLoading(crossPage: false);
        await Future.delayed(Duration(seconds: 2));
        context.pop();
        context.go('/');
      },
      children: [
        const Text(
          "邮箱",
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff667086),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "更换绑定邮箱后48小时内禁止提币和平台转账",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff667086),
          ),
        ),
        const SizedBox(height: 24),
        const UiTextField(
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("新邮箱"),
          ),
        ),
        const SizedBox(height: 24),
        CodeField(
          target: "123213",
        ),
      ],
    );
  }
}
