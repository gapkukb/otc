import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';

class F2ABind extends StatefulWidget {
  // final Function() onCompelete;
  const F2ABind({
    super.key,
    // required this.onCompelete,
  });

  @override
  State<F2ABind> createState() => _F2ABindState();
}

class _F2ABindState extends State<F2ABind> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "账户安全",
      title: "谷歌身份验证器",
      okButtonText: "下一步",
      onCompelete: (_) async {
        var cancel = BotToast.showLoading();
        await Future.delayed(const Duration(seconds: 1));
        cancel();
        // widget.onCompelete();
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
