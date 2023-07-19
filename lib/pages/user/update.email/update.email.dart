import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/form/text_filed/text_field.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({super.key});

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      title: "修改邮箱",
      nextText: "完成",
      onCompelete: (_) async {
        BotToast.showLoading(crossPage: false);
        context.pop();
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
        CodeField(target: "123213"),
      ],
    );
  }
}
