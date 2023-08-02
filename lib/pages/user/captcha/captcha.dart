library captha;

import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

part 'captcha.helper.dart';

class Captcha extends StatefulWidget {
  final CaptchaDevice? preferredDevice;
  final CaptchaSession? session;
  final String? account;
  final bool? autoStart;
  final bool? switchable;
  final String? legend;
  final UserModel? user;

  const Captcha({
    super.key,
    this.preferredDevice,
    this.session,
    this.account,
    this.autoStart,
    this.switchable,
    this.legend,
    this.user,
  });

  @override
  State<Captcha> createState() => _CaptchaState();
}

class _CaptchaState extends State<Captcha> {
  TextEditingController _controller = TextEditingController();
  final Map<String, dynamic> formState = {};
  final formKey = GlobalKey<FormState>();
  late CaptchaDevice device;

  paste() async {
    final code = await FlutterClipboard.paste();
    _controller.text = code;
  }

  @override
  void initState() {
    getDevice();
    if (widget.autoStart == true) send();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<CaptchaDevice> get supportedModes {
    if (widget.user == null) return [widget.preferredDevice!];
    return CaptchaDevice.values.where((mode) => mode.isValid(widget.user?.base)).toList();
  }

  getDevice() {
    // preferredDevice参数是设置验证模式偏好.
    // 但是要判断用户是否开启此模式
    // 优先级依照枚举排序 f2a->phone->email,
    device = widget.preferredDevice ?? CaptchaDevice.f2a;
    device = supportedModes.contains(device) ? device : widget.preferredDevice!;
  }

  String get description {
    if (device == CaptchaDevice.f2a) {
      return "请输入您的谷歌验证器6位数字验证码";
    }
    return "请输入您在${device.chineseText}$maskingAccount收到的6位验证码，验证码30分钟有效";
  }

  // 脱敏
  String get maskingAccount {
    if (device == CaptchaDevice.phone) {
      return maskPhoneNumber(widget.account ?? widget.user?.base.phone);
    }
    if (device == CaptchaDevice.email) {
      return maskEmail(widget.account ?? widget.user?.base.email);
    }
    return "";
  }

  List<Widget> get remainingModeWidget {
    return supportedModes.where((mode) => mode != device).map(
      (mode) {
        return UiButton.text(
          size: UiButtonSize.mini,
          onPressed: () {
            setState(() {
              device = mode;
              _controller = TextEditingController();
            });
          },
          child: Text("切换${mode.chineseText}验证"),
        );
      },
    ).toList();
  }

  CaptchaSession get session {
    return widget.session ?? CaptchaSession.normal;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ModalPageTemplate(
        okButtonText: "下一步",
        title: widget.legend ?? "${device.chineseText}验证",
        onCompelete: action,
        children: [
          if (session == CaptchaSession.funds)
            UiTextFormField(
              formState: formState,
              name: "payPassword",
              autofocus: true,
              labelText: "资金密码",
              maxLength: 6,
              keyboardType: TextInputType.number,
              validator: (value) {
                return value?.length == 6 ? null : "资金密码为6位数字";
              },
            )
          else
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.chineseText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff667086),
                  ),
                ),
              ],
            ),
          const Gap.small(),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff667086),
            ),
          ),
          const Gap.small(),
          if (device == CaptchaDevice.f2a)
            UiTextFormField(
              autofocus: session != CaptchaSession.funds,
              name: "code",
              formState: formState,
              labelText: "谷歌验证码",
              controller: _controller,
              maxLength: 6,
              validator: (value) {
                return value?.length == 6 ? null : "谷歌验证码为6位数字";
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: UiButton(
                  variant: UiButtonVariant.text,
                  label: "粘贴",
                  onPressed: paste,
                ),
              ),
            )
          else
            CodeField(
              textController: _controller,
              disabled: false,
              onPressed: send,
              onlyNumber: session != CaptchaSession.addF2A,
            ),
          ...switcher,
        ],
      ),
    );
  }

  List<Widget> get switcher {
    if (widget.switchable == false) {
      return [const SizedBox.shrink()];
    }

    return remainingModeWidget;
  }

  /// 发送验证码

  Future<bool> send() async {
    if (session == CaptchaSession.addF2A) {
      await apis.user.applyF2A({"device": device.value});
    } else {
      final Map<String, dynamic> payload = {
        "device": device.value,
        "session": session.value,
      };

      if (session == CaptchaSession.register || session == CaptchaSession.forget) {
        payload.addAll({
          "account": widget.account!,
        });
        await apis.user.sendCaptchaWithLogout(payload);
      } else {
        await apis.user.sendCaptcha(payload);
      }
    }
    Modal.showText(text: "验证码已发送,请注意查收");
    return true;
  }

  // 校验验证码
  action(_) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final String token = await session.validate(device, _controller.text);
      global.updateCaptchaToken(token);
      Navigator.of(context).maybePop<Map<String, dynamic>>(formState);
    }
  }
}
