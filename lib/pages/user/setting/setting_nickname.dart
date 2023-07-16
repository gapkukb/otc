import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class SettingNickname extends ConsumerStatefulWidget {
  const SettingNickname({super.key});

  @override
  ConsumerState<SettingNickname> createState() => _SettingNicknameState();
}

class _SettingNicknameState extends ConsumerState<SettingNickname> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "个人资料",
      title: "修改昵称",
      icon: Icons.edit_outlined,
      onCompelete: () async {
        await apis.user.modifyNickname({"value": controller.text});
        ref.read(userProvider.notifier).updateUser();
        if (context.mounted) context.pop();
        Modal.showText(text: "更新成功");
      },
      children: [
        UiTextFormField(
          controller: controller,
          autofocus: true,
          labelText: "昵称",
          maxLength: 20,
          decoration: const InputDecoration(
            hintText: "昵称长度不能超过20个字符",
            border: UnderlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return "昵称不能为空";
            if (value.length > 20) return "昵称长度不能超过20个字符";
            return null;
          },
        ),
      ],
    );
  }
}
