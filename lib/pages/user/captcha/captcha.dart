library captha;

import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

part 'captcha.helper.dart';

class Captcha extends StatefulWidget {
  final CaptchaDeviceType? preferredDevice;
  final CaptchaServiceType service;
  final String? account;
  final bool? autoStart;
  final bool? switchable;
  final String? legend;
  final UserModel? user;

  const Captcha({
    super.key,
    this.preferredDevice,
    required this.service,
    this.account,
    this.autoStart,
    this.switchable,
    this.legend,
    this.user,
  });

  @override
  State<Captcha> createState() => _CaptchaState();
}

class _CaptchaState extends State<Captcha> with CaptchaController {
  @override
  void initState() {
    // 参数是设置验证模式偏好
    // 但是要判断用户是否开启此模式
    // 优先级依照枚举排序 f2a->phone->email,

    _initMode();
    if (widget.autoStart == true) send();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<CaptchaDeviceType> get supportedModes {
    if (widget.user == null) return [_mode];
    return CaptchaDeviceType.values
        .where((mode) => mode.isValid(widget.user?.base))
        .toList();
  }

  _initMode() {
    _mode = widget.preferredDevice ?? CaptchaDeviceType.f2a;
    _mode =
        supportedModes.contains(_mode) ? _mode : supportedModes.elementAt(0);
  }

  String get description {
    if (_mode == CaptchaDeviceType.f2a) {
      return "请输入您的谷歌验证器6位数字验证码";
    }
    return "请输入您在${_mode.chineseText}$maskingAccount收到的6位验证码，验证码30分钟有效";
  }

  // 脱敏
  String get maskingAccount {
    if (_mode == CaptchaDeviceType.phone) {
      return maskPhoneNumber(widget.account ?? widget.user?.base.phone);
    }
    if (_mode == CaptchaDeviceType.email) {
      return maskEmail(widget.account ?? widget.user?.base.email);
    }
    return "";
  }

  List<Widget> get remainingModeWidget {
    return supportedModes.where((mode) => mode != _mode).map(
      (mode) {
        return UiButton.text(
          size: UiButtonSize.mini,
          onPressed: () {
            setState(() {
              _mode = mode;
              _controller = TextEditingController();
            });
          },
          child: Text("切换${mode.chineseText}验证"),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      nextText: "下一步",
      title: widget.legend ?? "${_mode.chineseText}验证",
      onCompelete: (_) async {
        final code = _controller.text;
        if (code.length != _length) {
          Modal.showText(text: "请输入6位验证码");
          return;
        }

        await widget.service.validate(device, code);

        context.pop({
          "device": device,
          "code": code,
        });
      },
      children: [
        if (widget.service == CaptchaServiceType.funds)
          UiTextFormField(
            name: "funds",
            autofocus: true,
            labelText: "资金密码为6位数字",
            maxLength: 6,
            keyboardType: const TextInputType.numberWithOptions(),
          )
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _mode.chineseText,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff667086),
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff667086),
                ),
              ),
            ],
          ),
        const SizedBox(height: 24),
        if (_mode == CaptchaDeviceType.f2a)
          UiTextFormField(
            autofocus: widget.service != CaptchaServiceType.funds,
            labelText: "谷歌验证码为6位数字",
            controller: _controller,
            maxLength: 6,
            keyboardType: const TextInputType.numberWithOptions(),
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
            onlyNumber: widget.service != CaptchaServiceType.addF2A,
          ),
        ...switcher,
      ],
    );
  }

  List<Widget> get switcher {
    if (widget.switchable == false) {
      return [const SizedBox.shrink()];
    }

    return remainingModeWidget;
  }

  Future<bool> send() async {
    if (widget.service == CaptchaServiceType.addF2A) {
      await apis.user.applyF2A({"device": device});
    } else {
      final Map<String, dynamic> payload = {
        "device": device,
        "session": widget.service.value,
      };

      if (widget.service == CaptchaServiceType.register) {
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
}
