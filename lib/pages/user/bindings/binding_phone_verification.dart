import 'package:flutter/material.dart';
import 'package:otc/components/user_modal_page_template/user_modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';

class BindingPhoneVerification extends StatefulWidget {
  const BindingPhoneVerification({super.key});

  @override
  State<BindingPhoneVerification> createState() =>
      _BindingPhoneVerificationState();
}

class _BindingPhoneVerificationState extends State<BindingPhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return UserModalPageTemplate(
      legend: "绑定手机",
      title: "手机验证",
      nextText: "下一步",
      onCompelete: () {},
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
          onPressed: () {},
        )
      ],
    );
  }
}
