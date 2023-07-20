import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/global/global.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/theme/text_theme.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({super.key});

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};
  final controller = TextEditingController();
  bool disabled = true;
  String captcha = "";

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  listener() {
    setState(() {
      disabled = !global.regexp.email.hasMatch(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        title: "修改邮箱",
        nextText: "完成",
        onCompelete: (_) async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            await apis.user.validateBindDevice({
              ..._formState,
              "device": CaptchaDeviceType.email.value,
            });
            ProviderContainer().read(userProvider.notifier).updateUser();
            context.pop();
          }
        },
        children: [
          const Text(
            "邮箱",
            style: Font.largeGrey,
          ),
          const SizedBox(height: 8),
          const Text(
            "更换绑定邮箱后48小时内禁止提币和平台转账",
            style: Font.miniGrey,
          ),
          const SizedBox(height: 24),
          TextFormFieldEmail(
            name: "device",
            formState: _formState,
            controller: controller,
            labelText: "新邮箱",
          ),
          const SizedBox(height: 24),
          CodeField(
            disabled: disabled,
            formState: _formState,
            onlyNumber: false,
            name: "captcha",
            validator: (value) {
              return value?.length == 6 ? null : "验证码必须是6位字符";
            },
            onPressed: () async {
              try {
                await apis.user.bindDevice({
                  "device": CaptchaDeviceType.email.value,
                  "account": controller.text,
                });
                return true;
              } catch (e) {
                return false;
              }
            },
          ),
        ],
      ),
    );
  }
}
