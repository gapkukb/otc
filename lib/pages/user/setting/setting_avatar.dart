import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/upload/upload.dart';
import 'package:otc/providers/user.provider.dart';

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
          final urls = await controller.upload();
          await apis.user.modifyAvatar({
            "value": urls[0],
          });
          ref.read(userProvider.notifier).updateUser();
          context.pop();
          Modal.showText(text: "更新成功");
        } finally {
          close();
        }
      },
      children: [
        Upload(controller: controller),
      ],
    );
  }
}
