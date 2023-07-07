import 'package:flutter/material.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_field.dart';

class SettingNickname extends StatefulWidget {
  const SettingNickname({super.key});

  @override
  State<SettingNickname> createState() => _SettingNicknameState();
}

class _SettingNicknameState extends State<SettingNickname> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "个人资料",
      title: "修改昵称",
      onCompelete: () {
        Modal.showText(text: "更新成功");
      },
      children: [
        UiTextField(
          autofocus: true,
          label: "昵称",
          maxLength: 20,
          decoration: InputDecoration(
            hintText: "昵称长度不能超过20个字符",
            border: UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
