import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/user_modal_page_template/user_modal_page_template.dart';

class UserEmailAddressPrev extends StatefulWidget {
  final Function() onCompelete;
  const UserEmailAddressPrev({
    super.key,
    required this.onCompelete,
  });

  @override
  State<UserEmailAddressPrev> createState() => _UserEmailAddressPrevState();
}

class _UserEmailAddressPrevState extends State<UserEmailAddressPrev> {
  final _controller = TextEditingController();

  String uname = "abc";

  @override
  Widget build(BuildContext context) {
    return UserModalPageTemplate(
      title: "修改邮箱",
      nextText: "下一步",
      onCompelete: () async {
        var cancel = BotToast.showLoading();
        await Future.delayed(Duration(seconds: 2));
        cancel();
        widget.onCompelete();
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
        Text(
          "请输入您在邮箱$uname收到的6位验证码，验证码30分钟有效",
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff667086),
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
