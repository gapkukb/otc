import 'package:flutter/material.dart';
import 'package:otc/pages/components/modal/modal.dart';
import 'package:otc/pages/components/user_modal_page_template/user_modal_page_template.dart';
import 'package:otc/widgets/ui_file_picker.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:intl/intl.dart';

class AuthJunior extends StatefulWidget {
  const AuthJunior({super.key});

  @override
  State<AuthJunior> createState() => _AuthJuniorState();
}

class _AuthJuniorState extends State<AuthJunior> {
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
      title: "中级身份认证",
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
        "上传个人身份证",
        style: TextStyle(fontSize: 18),
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
      const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text("身份证正面（人像面）"),
                SizedBox(height: 8),
                UiFilePicker(),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Text("身份证正面（人像面）"),
                SizedBox(height: 8),
                UiFilePicker(),
              ],
            ),
          ),
        ],
      ),
    ];
  }
}
