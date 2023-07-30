import 'package:flutter/material.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';

class BindingPhoneVerification extends StatefulWidget {
  const BindingPhoneVerification({super.key});

  @override
  State<BindingPhoneVerification> createState() => _BindingPhoneVerificationState();
}

class _BindingPhoneVerificationState extends State<BindingPhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "绑定手机",
      title: "手机验证",
      okButtonText: "下一步",
      onCompelete: (_) {},
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
