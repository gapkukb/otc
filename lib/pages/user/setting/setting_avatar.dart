import 'package:flutter/material.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/router/modal_page.dart';
import 'package:otc/widgets/ui_file_picker.dart';

class SettingAvatar extends StatefulWidget {
  const SettingAvatar({super.key});

  @override
  State<SettingAvatar> createState() => _SettingAvatarState();
}

class _SettingAvatarState extends State<SettingAvatar> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "个人资料",
      title: "修改头像",
      onCompelete: () {},
      children: [
        SizedBox(
          width: 100,
          child: UiFilePicker(),
        ),
      ],
    );
  }
}
