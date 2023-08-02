import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/upload/upload.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/widgets/ui_file_picker.dart';

class SettingAvatar extends ConsumerStatefulWidget {
  const SettingAvatar({super.key});

  @override
  ConsumerState<SettingAvatar> createState() => _SettingAvatarState();
}

class _SettingAvatarState extends ConsumerState<SettingAvatar> {
  final controller = UploadController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return ModalPageTemplate(
      legend: "个人资料",
      title: "修改头像",
      onCompelete: (context) async {
        if (controller.items.isEmpty) {
          Modal.showText(text: "请选择图片");
          return;
        }
        final close = Modal.showLoading("正在上传并提交，这可能需要一点时间\n请勿离开");
        try {
          final formData = FormData.fromMap({
            "file": controller.items.map((file) {
              return MultipartFile.fromFileSync(file.path);
            }).toList(),
          });

          await apis.app.uploadImage(formData);
          await ref.read(userProvider.notifier).updateUser();
          context.pop();
          Modal.showText(text: "更新成功");
        } finally {
          close();
        }
      },
      children: [
        Upload(controller: controller),
        // SizedBox(
        //   width: 100,
        //   child: UiFilePicker(
        //     onChange: (file) async {
        //       final source = await MultipartFile.fromFile(file!.path);
        //       // final cancel = Modal.showLoading("正在上传中...请勿关闭页面");
        //       final url = await apis.app.uploadImage({"file": source});
        //       await apis.user.modifyAvatar({"value": url});
        //       ref.read(userProvider.notifier).updateUser();
        //       if (context.mounted) context.pop();
        //       // cancel();
        //     },
        //   ),
        // ),
      ],
    );
  }
}
