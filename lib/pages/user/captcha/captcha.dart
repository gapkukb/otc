import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/countdown_button/countdown_button.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

enum CaptchaDeviceType {
  phone("PHONE"),
  email("EMAIL");

  const CaptchaDeviceType(this.value);

  final String value;
}

enum CaptchaServiceType {
  addBankcard("add-bankcard"),
  editBankcard("edit-bankcard"),
  delBankcard("del-bankcard"),
  addAddressBook("add-address-book"),
  editAddressBook("edit-address-book"),
  delAddressBook("del-address-book"),
  addQrcode("add-qrcode"),
  editQrcode("edit-qrcode"),
  delQrcode("del-qrcode"),
  boundEmail("bound-email"),
  boundPhone("bound-phone"),
  register("register");

  const CaptchaServiceType(this.value);

  final String value;
}

class Captcha extends StatefulWidget {
  final CaptchaDeviceType device;
  final CaptchaServiceType service;
  final String? account;
  final bool autoStart;

  const Captcha({
    super.key,
    required this.device,
    required this.service,
    this.account = "123132",
    this.autoStart = true,
  });

  @override
  State<Captcha> createState() => _CaptchaState();
}

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 3;

class _CaptchaState extends State<Captcha> {
  final _controller = TextEditingController();
  final countdownTimerController = CountdownTimerController(
    endTime: DateTime.now().millisecondsSinceEpoch,
  );

  final int _length = 6;
  String code = "";
  bool _isPhone = false;

  @override
  void initState() {
    _isPhone = widget.device == CaptchaDeviceType.phone;
    if (widget.autoStart) {
      send();
    }
    super.initState();
  }

  String get typeText {
    return getType(_isPhone);
  }

  getType(bool isphone) {
    return isphone ? '手机' : '邮箱';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "账户安全",
                      style: TextStyle(
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "$typeText验证",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff0D163A),
                    ),
                  ),
                  trailing: const Opacity(
                    opacity: 0.2,
                    child: Icon(
                      Icons.mark_email_unread,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(height: 1),
                const SizedBox(height: 24),
                Text(
                  typeText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff667086),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "请输入您在${typeText}${maskingAccount}收到的6位验证码，验证码30分钟有效",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff667086),
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(),
                _buildToggleButton(),
                const SizedBox(height: 24),
                _buildActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 脱敏
  String get maskingAccount {
    final String text = widget.account ?? "";
    if (text == "") return "";
    if (_isPhone) {
      return text.replaceRange(
        3,
        text.length - 4,
        List.generate(text.length - 7, (index) => "*").join(""),
      );
    }
    var index = text.indexOf("@");
    return text.replaceRange(
      1,
      index - 1,
      List.generate(index - 1, (index) => "*").join(""),
    );
  }

  _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        UiButton(
          label: "取消",
          size: UiButtonSize.small,
          variant: UiButtonVariant.text,
          onPressed: () {
            context.pop(null);
          },
        ),
        UiButton(
          label: "下一步",
          size: UiButtonSize.small,
          variant: UiButtonVariant.text,
          onPressed: () {
            if (_controller.text.length != _length) {
              BotToast.showText(text: "请正确填写$_length数字验证码！");
              return;
            }
            context.pop(_controller.text);
          },
        ),
      ],
    );
  }

  _buildTextField() {
    return UiTextFormField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
      ),
      maxLength: _length,
      decoration: _inputDecoration(),
      validator: (value) {
        return value!.length == _length ? null : "必须是6位数字";
      },
    );
  }

  _inputDecoration() {
    return InputDecoration(
      label: Text("$typeText验证码"),
      border: const OutlineInputBorder(),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CountdownButton(
          controller: countdownTimerController,
          onPressed: send,
        ),
      ),
    );
  }

  _buildToggleButton() {
    if (widget.service == CaptchaServiceType.register) {
      return const SizedBox.shrink();
    }
    return TextButton(
      child: Text("切换${getType(!_isPhone)}验证"),
      onPressed: () {
        setState(() {
          _isPhone = !_isPhone;
        });
      },
    );
  }

  Future send() async {
    final Map<String, dynamic> payload = {
      "device": _isPhone
          ? CaptchaDeviceType.phone.value
          : CaptchaDeviceType.email.value,
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

    Modal.showText(text: "验证码已发送,请注意查收");
  }
}
