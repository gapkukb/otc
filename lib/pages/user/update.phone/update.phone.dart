import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';

class UpdatePhone extends StatefulWidget {
  const UpdatePhone({super.key});

  @override
  State<UpdatePhone> createState() => _UpdatePhoneState();
}

class _UpdatePhoneState extends State<UpdatePhone> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool phoneValid = false;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(getValid);
  }

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    phoneController.removeListener(getValid);
    super.dispose();
  }

  getValid() async {
    await Future.delayed(const Duration(microseconds: 1));

    final $phoneValid = _formKey.currentState?.validate() ?? false;
    if ($phoneValid != phoneValid) {
      setState(() {
        phoneValid = $phoneValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      title: "修改手机",
      onCompelete: (_) {},
      children: [
        Form(
          key: _formKey,
          child: TextFormFieldPhone(
            controller: phoneController,
            autofocus: true,
            labelText: "新手机",
          ),
        ),
        const SizedBox(height: 24),
        CodeField(
          disabled: !phoneValid,
          autofocus: false,
          labelText: "手机验证码",
        ),
      ],
    );
  }
}
