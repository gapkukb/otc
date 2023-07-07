import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class SettingNickname extends StatefulWidget {
  const SettingNickname({super.key});

  @override
  State<SettingNickname> createState() => _SettingNicknameState();
}

class _SettingNicknameState extends State<SettingNickname> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "个人资料",
      title: "修改昵称",
      icon: Icons.edit_outlined,
      onCompelete: () {
        Modal.showText(text: "更新成功");
        context.pop(text);
      },
      children: [
        UiTextFormField(
          autofocus: true,
          labelText: "昵称",
          maxLength: 20,
          decoration: const InputDecoration(
            hintText: "昵称长度不能超过20个字符",
            border: UnderlineInputBorder(),
          ),
          validator: (value) {
            text = value;
            if (value == null || value.isEmpty) return "昵称不能为空";
            if (value.length > 20) return "昵称长度不能超过20个字符";
            return null;
          },
        ),
      ],
    );
  }
}
