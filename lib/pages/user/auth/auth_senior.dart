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

class AuthSenior extends StatefulWidget {
  const AuthSenior({super.key});

  @override
  State<AuthSenior> createState() => _AuthSeniorState();
}

class _AuthSeniorState extends State<AuthSenior> {
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
        nextText: "提交",
        onCompelete: (_) async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();

            final close = Modal.showLoading("正在上传并提交，这可能需要一点时间\n请勿离开");
            try {
              final formData = FormData.fromMap({
                "file": (formState['idVideo'] as List<File>).map((file) {
                  return MultipartFile.fromFileSync(file.path);
                }).toList(),
              });

              final urls = (await apis.app.uploadVideo(formData)).cast<String>();
              formState.remove("idVideo");
              formState.addAll({
                "value": urls[0],
              });
              await apis.kyc.authLv3(formState);
              await provider.read(userProvider.notifier).updateUser();
              context.pop();
              Modal.alert(content: "平台会在48小时内审核完毕！", title: "您的个人信息上传成功");
            } finally {
              close();
            }
          }
        },
        children: [
          const Text(
            "您即将上传视频。请确保",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            "• 这是您的官方未过期证件\n• 视频长度在3~10秒\n• 请保证是您本人手持本人的身份证\n• 请保证可以看清身份证的信息",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
          Upload(
            controller: controller,
            formStore: formState,
            name: "idVideo",
            titles: const ["手持身份证视频"],
            itemSize: 150,
            max: 1,
            mediaType: MediaType.video,
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
