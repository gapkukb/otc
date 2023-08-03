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
import 'package:otc/theme/text_theme.dart';

class AuthJunior extends StatefulWidget {
  const AuthJunior({super.key});

  @override
  State<AuthJunior> createState() => _AuthJuniorState();
}

class _AuthJuniorState extends State<AuthJunior> {
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formState = {};
  final controller = UploadController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ModalPageTemplate(
        legend: "身份认证",
        title: "中级身份认证",
        okButtonText: "下一步",
        onCompelete: (_) async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            final close = Modal.showLoading("正在上传并提交，这可能需要一点时间\n请勿离开");
            try {
              final urls = await controller.upload();
              formState.remove("idPicture");
              formState.addAll({
                "value": urls[0],
              });
              await apis.kyc.authLv2(formState);
              provider.read(userProvider.notifier).updateUser();
              context.pop();
              Modal.alert(content: "平台会在48小时内审核完毕！", title: "您的个人信息上传成功");
            } finally {
              close();
            }
          }
        },
        children: [
          const Text(
            "上传个人身份证",
            style: Font.largeGrey,
          ),
          const SizedBox(height: 8),
          const Text(
            "• 这是您的官方未过期证件\n• 这是原始文档，而非扫描件或副本\n•请保证是您本人手持本人的身份证\n• 请保证可以看清身份证的信息",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
          Upload(
            controller: controller,
            formStore: formState,
            titles: const ["手持身份证"],
            itemSize: 150,
            max: 1,
            validator: (files) {
              if (files.isEmpty) return "请上传您的手持身份证照";
              return null;
            },
          ),
        ],
      ),
    );
  }
}
