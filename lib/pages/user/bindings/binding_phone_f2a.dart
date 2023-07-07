import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';

class BindingPhoneF2A extends StatefulWidget {
  final Function() onCompelete;
  const BindingPhoneF2A({
    super.key,
    required this.onCompelete,
  });

  @override
  State<BindingPhoneF2A> createState() => _BindingPhoneF2AState();
}

class _BindingPhoneF2AState extends State<BindingPhoneF2A> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "绑定手机",
      title: "谷歌身份验证器",
      nextText: "下一步",
      onCompelete: () async {
        var cancel = BotToast.showLoading();
        await Future.delayed(const Duration(seconds: 1));
        cancel();
        widget.onCompelete();
      },
      children: [
        const UiTextField(
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          maxLength: 6,
          decoration: InputDecoration(
            label: Text("谷歌6位验证码"),
            border: OutlineInputBorder(),
            counterText: "",
          ),
        ),
        TextButton(
          child: const Text("切换邮箱验证"),
          onPressed: () {
            context.go('/email');
          },
        )
      ],
    );
  }
}
