import 'package:flutter/material.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';

class BindingPhoneUpdate extends StatefulWidget {
  const BindingPhoneUpdate({super.key});

  @override
  State<BindingPhoneUpdate> createState() => _BindingPhoneUpdateState();
}

class _BindingPhoneUpdateState extends State<BindingPhoneUpdate> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "绑定手机",
      title: "修改手机",
      onCompelete: () {},
      children: [
        const UiTextField(
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          maxLength: 11,
          decoration: InputDecoration(
            label: Text("新手机"),
            border: OutlineInputBorder(),
            counterText: "",
          ),
        ),
        const SizedBox(height: 24),
        CodeField(
          labelText: "手机验证码",
        ),
      ],
    );
  }
}
