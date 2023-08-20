import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/theme/text_theme.dart';

class UpdatePhone extends StatefulWidget {
  const UpdatePhone({super.key});

  @override
  State<UpdatePhone> createState() => _UpdatePhoneState();
}

class _UpdatePhoneState extends State<UpdatePhone> {
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
      disabled = controller.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        title: "修改手机",
        okButtonText: "完成",
        onCompelete: (_) async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            final token = await apis.security.validateOpenCaptcha({
              ..._formState,
              "session": CaptchaSession.boundDevice.value,
              "device": CaptchaDevice.phone.value,
            });
            await apis.user.bindDevice({
              "account": controller.text,
              "boundToken": token,
              "boundDevice": CaptchaDevice.phone.value,
            });

            provider.read(userProvider.notifier).updateUser();
            context.pop();
            Modal.showText(text: "手机修改成功");
          }
        },
        children: [
          const Text(
            "手机",
            style: Font.largeGrey,
          ),
          const SizedBox(height: 8),
          const Text(
            "更换绑定手机后48小时内禁止提币和平台转账",
            style: Font.miniGrey,
          ),
          const SizedBox(height: 24),
          TextFormFieldPhone(
            name: "account",
            formState: _formState,
            controller: controller,
            labelText: "新手机",
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
                await apis.user.sendCaptchaWithLogout({
                  "session": CaptchaSession.boundDevice.value,
                  "device": CaptchaDevice.phone.value,
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
