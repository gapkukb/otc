import 'package:flutter/material.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/user_modal_page_template/user_modal_page_template.dart';
import 'package:otc/widgets/ui_file_picker.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:intl/intl.dart';
import 'package:otc/widgets/ui_video_picker.dart';

class AuthSenior extends StatefulWidget {
  const AuthSenior({super.key});

  @override
  State<AuthSenior> createState() => _AuthSeniorState();
}

class _AuthSeniorState extends State<AuthSenior> {
  bool _isNext = true;
  DateTime _dateTime = DateTime.now();
  late TextEditingController _controller;

  get _dateTimeText {
    return DateFormat('yyyy-MM-dd').format(_dateTime);
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserModalPageTemplate(
      legend: "身份认证",
      title: "高级身份认证",
      nextText: "继续",
      onCompelete: () {
        Modal.show(
          okText: "完成",
          title: "您的个人信息上传成功",
          content: "平台会在48小时内审核完毕！",
          onOk: () {
            Navigator.of(context).pop();
          },
        );
      },
      children: _isNext ? _buildNext() : _buildPrimary(),
    );
  }

  _buildPrimary() {
    return [
      const UiTextField(
        readOnly: true,
        label: "证件签发国/地区",
      ),
      const SizedBox(height: 16),
      UiTextField(
        label: "身份证号码",
        controller: _controller,
        decoration: const InputDecoration(
          helperText: "使用政府签发的有效文件，目前仅接受身份证",
        ),
      ),
    ];
  }

  _buildNext() {
    return [
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
      const SizedBox(height: 16),
      const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("手持身份证视频"),
                SizedBox(height: 8),
                UiVideoPicker(),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: SizedBox.shrink(),
          ),
        ],
      ),
    ];
  }
}
