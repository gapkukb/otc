import 'package:flutter/material.dart';
import 'package:otc/components/user_modal_page_template/user_modal_page_template.dart';
import 'package:otc/router/modal_route.dart';
import 'package:otc/widgets/ui_file_picker.dart';

class UpdateAvatar extends StatefulWidget {
  const UpdateAvatar({super.key});

  @override
  State<UpdateAvatar> createState() => _UpdateAvatarState();
}

class _UpdateAvatarState extends State<UpdateAvatar> {
  @override
  Widget build(BuildContext context) {
    return UserModalPageTemplate(
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
