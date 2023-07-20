import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class UpdateFundsPwd extends StatefulWidget {
  const UpdateFundsPwd({super.key});

  @override
  State<UpdateFundsPwd> createState() => _UpdateFundsPwdState();
}

class _UpdateFundsPwdState extends State<UpdateFundsPwd> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        title: "重置资金密码",
        onCompelete: (_) async {
          if (_formKey.currentState!.validate()) {
            await apis.user.authPayPwd(_formState);
            Modal.showText(text: "修改资金密码成功");
          }
        },
        children: [
          UiTextFormField(
            name: "pwd",
            formState: _formState,
            obscureText: true,
            autofocus: true,
            labelText: "资金密码为6位数字",
            maxLength: 6,
            maxLines: 1,
            keyboardType: TextInputType.number,
            controller: _controller,
            validator: (value) {
              return value!.length == 6 ? null : "资金密码格式不正确";
            },
          ),
          const SizedBox(height: 24),
          UiTextFormField(
            formState: _formState,
            obscureText: true,
            labelText: "请再次输入资金密码",
            maxLength: 6,
            maxLines: 1,
            keyboardType: TextInputType.number,
            validator: (value) {
              return value == _controller.text ? null : "两次资金密码不一致";
            },
          ),
        ],
      ),
    );
  }
}
