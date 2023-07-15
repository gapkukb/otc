library captha;

import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

part 'captcha.controller.dart';

class Captcha extends StatefulWidget {
  final CaptchaDeviceType device;
  final CaptchaServiceType service;
  final String? account;
  final bool autoStart;
  final bool switchable;
  final String? legend;

  const Captcha({
    super.key,
    required this.device,
    required this.service,
    this.account,
    this.autoStart = false,
    this.switchable = true,
    this.legend,
  });

  @override
  State<Captcha> createState() => _CaptchaState();
}

class _CaptchaState extends State<Captcha> {
  TextEditingController textController = TextEditingController();

  final int _length = 6;

  late CaptchaDeviceType _mode;

  @override
  void initState() {
    _mode = widget.device;
    if (widget.autoStart) {
      send();
    }
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  String get device {
    return _mode.value;
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
      return maskPhoneNumber(widget.account ?? global.user?.phone);
    }
    if (_mode == CaptchaDeviceType.email) {
      return maskEmail(widget.account ?? global.user?.email);
    }
    return "";
  }

  List<Widget> get remainingModeWidget {
    return CaptchaDeviceType.values
        .where((mode) => mode != _mode && mode.isValid(global.user))
        .map((mode) {
      return UiButton.text(
        size: UiButtonSize.mini,
        onPressed: () {
          setState(() {
            _mode = mode;
            textController = TextEditingController();
          });
        },
        child: Text("切换${mode.chineseText}验证"),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      nextText: "下一步",
      title: widget.legend ?? "${_mode.chineseText}验证",
      onCompelete: () async {
        final code = textController.text;
        if (code.length != _length) {
          Modal.showText(text: "请输入6位验证码");
          return;
        }

        await widget.service.validate(widget.device, code);

        context.pop({
          "device": device,
          "code": code,
        });
      },
      children: [
        Text(
          _mode.chineseText,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xff667086),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff667086),
          ),
        ),
        const SizedBox(height: 24),
        if (_mode == CaptchaDeviceType.f2a)
          UiTextFormField(
            autofocus: true,
            labelText: "谷歌6位数字验证码",
            controller: textController,
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
            textController: textController,
            onPressed: send,
            onlyNumber: widget.service != CaptchaServiceType.addF2A,
          ),
        ...switcher,
      ],
    );
  }

  List<Widget> get switcher {
    if (widget.service == CaptchaServiceType.register || !widget.switchable) {
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

  paste() async {
    final code = await FlutterClipboard.paste();
    textController.text = code;
  }
}
