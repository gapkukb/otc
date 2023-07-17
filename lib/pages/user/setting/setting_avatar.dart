import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/widgets/ui_file_picker.dart';

class SettingAvatar extends ConsumerWidget {
  const SettingAvatar({super.key});

  @override
  Widget build(context, ref) {
    return ModalPageTemplate(
      legend: "个人资料",
      title: "修改头像",
      onCompelete: () {},
      children: [
        SizedBox(
          width: 100,
          child: UiFilePicker(
            onChange: (file) async {
              final source = await MultipartFile.fromFile(file!.path);
              // final cancel = Modal.showLoading("正在上传中...请勿关闭页面");
              final url = await apis.app.uploadImage({"file": source});
              await apis.user.modifyAvatar({"value": url});
              ref.read(userProvider.notifier).updateUser();
              if (context.mounted) context.pop();
              // cancel();
            },
          ),
        ),
      ],
    );
  }
}
