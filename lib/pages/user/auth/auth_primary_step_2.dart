import 'package:flutter/material.dart';
import 'package:otc/components/upload/upload.dart';
import 'package:otc/theme/text_theme.dart';

class AuthPrimaryStep2 extends StatelessWidget {
  final UploadController controller;
  final Map<String, dynamic> formState;

  const AuthPrimaryStep2({
    super.key,
    required this.controller,
    required this.formState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "上传个人身份证",
          style: Font.largeGrey,
        ),
        const SizedBox(height: 8),
        const Text(
          "• 这是您的官方未过期证件\n• 这是原始文档，而非扫描件或副本\n•可读取且清晰明亮\n• 不反光、不模糊\n• 无黑白图像，未被编辑\n• 请将证件置于纯色背景下",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
        ),
        const SizedBox(height: 16),
        Upload(
          controller: controller,
          formStore: formState,
          titles: const ["身份证正面（人像面）", "身份证反面（国徽面）"],
          itemSize: 150,
          max: 2,
          validator: (files) {
            if (files.length != 2) return "请分别上传您的身份证正反面照";
            return null;
          },
        ),
      ],
    );
  }
}
