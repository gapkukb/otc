import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/upload/upload.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/user.provider.dart';
import './auth_primary_step_1.dart';
import './auth_primary_step_2.dart';

class AuthPrimary extends StatefulWidget {
  const AuthPrimary({super.key});

  @override
  State<AuthPrimary> createState() => _AuthPrimaryState();
}

class _AuthPrimaryState extends State<AuthPrimary> {
  int step = 1;
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
        okButtonText: "下一步",
        onCompelete: (_) async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (step == 1) {
              setState(() {
                step++;
              });
            } else {
              final close = Modal.showLoading("正在上传并提交，这可能需要一点时间\n请勿离开");
              try {
                final urls = await controller.upload();
                formState.addAll({
                  "front": urls[0],
                  "back": urls[1],
                });
                await apis.kyc.authLv1(formState);
                provider.read(userProvider.notifier).updateUser();
                context.pop();
                Modal.alert(content: "平台会在48小时内审核完毕！", title: "您的个人信息上传成功");
              } finally {
                close();
              }
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
