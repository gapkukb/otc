import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/upload/upload.dart';
import './auth_primary_step_1.dart';
import './auth_primary_step_2.dart';

class AuthPrimary extends StatefulWidget {
  const AuthPrimary({super.key});

  @override
  State<AuthPrimary> createState() => _AuthPrimaryState();
}

class _AuthPrimaryState extends State<AuthPrimary> {
  int step = 2;
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formState = {};
  final controller = UploadController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ModalPageTemplate(
        legend: "身份认证",
        title: "初级认证",
        nextText: "下一步",
        onCompelete: (_) async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (step == 1) {
              setState(() {
                step++;
              });
            } else {
              final result = await controller.upload();

              // apis.kyc.authLv1({
              //   "identity": "",
              //   "name": "",
              //   "age": 0,
              //   "front": "",
              //   "back": ""
              // });
            }
          }
        },
        children: [
          Visibility(
            visible: step == 1,
            child: AuthPrimaryStep1(formState: formState),
          ),
          Visibility(
            visible: step == 2,
            child: AuthPrimaryStep2(
              controller: controller,
              formState: formState,
            ),
          ),
        ],
      ),
    );
  }
}
