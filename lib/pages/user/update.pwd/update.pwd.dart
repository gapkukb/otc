import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/pages/retrieve_password/retrieve_password.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class UpdatePwd extends StatefulWidget {
  const UpdatePwd({super.key});
  @override
  State<UpdatePwd> createState() => _UpdatePwdState();
}

class _UpdatePwdState extends State<UpdatePwd> {
  final Map<String, dynamic> _formState = {};
  final _formKey = GlobalKey<FormState>();
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      title: "修改登录密码",
      onCompelete: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          await apis.user.updatePwd(_formState);
          Modal.showText(text: "密码修改成功");
          if (mounted) context.pop();
        }
      },
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormFieldPassword(
                name: "oldPwd",
                labelText: "原登录密码",
                formState: _formState,
              ),
              const SizedBox(height: 16),
              TextFormFieldPassword(
                controller: controller,
                labelText: "新登录密码",
                name: "newPwd",
                formState: _formState,
              ),
              const SizedBox(height: 16),
              UiTextFormField(
                labelText: "确认新密码",
                obscureText: true,
                maxLines: 1,
                name: "renewPwd",
                validator: (value) {
                  if (value != controller.text) return "两次密码输入不一致";
                  return null;
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
