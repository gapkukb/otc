import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/global/global.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/theme/text_theme.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({super.key});

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final captchaController = TextEditingController();
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
    captchaController.dispose();
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
        okButtonText: "完成",
        onCompelete: (_) async {
          if (_formKey.currentState!.validate()) {
            final token = await apis.security.validateOpenCaptcha({
              "session": CaptchaSession.boundDevice.value,
              "device": CaptchaDevice.email.value,
              "captcha": captchaController.text,
              "account": controller.text,
            });

            await apis.user.bindDevice({
              "account": controller.text,
              "boundToken": token,
              "boundDevice": CaptchaDevice.email.value,
            });

            provider.read(userProvider.notifier).updateUser();
            context.pop();
            Modal.showText(text: "邮箱修改成功");
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
            controller: controller,
            labelText: "新邮箱",
          ),
          const SizedBox(height: 24),
          CodeField(
            disabled: disabled,
            onlyNumber: false,
            name: "captcha",
            textController: captchaController,
            validator: (value) {
              return value?.length == 6 ? null : "验证码必须是6位字符";
            },
            onPressed: () async {
              try {
                await apis.user.sendCaptchaWithLogout({
                  "session": CaptchaSession.boundDevice.value,
                  "device": CaptchaDevice.email.value,
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
