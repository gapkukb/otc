import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/countdown_button/countdown_button.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/pages/wallet/wallet_home/wallet_home.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_field.dart';

class CaptchaServiceType {
  static const String any = "";
  static const String addBankcard = "add-bankcard";
  static const String editBankcard = "edit-bankcard";
  static const String delBankcard = "del-bankcard";
  static const String addAddressBook = "add-address-book";
  static const String editAddressBook = "edit-address-book";
  static const String delAddressBook = "del-address-book";
  static const String addQrcode = "add-qrcode";
  static const String editQrcode = "edit-qrcode";
  static const String delQrcode = "del-qrcode";
  static const String boundEmail = "bound-email";
  static const String boundPhone = "bound-phone";
  static const String register = "register";
}

class CaptchaDeviceType {
  static const String phone = "PHONE";
  static const String email = "EMAIL";
}

class Captcha extends StatefulWidget {
  final String device;
  final String service;
  final String account;

  const Captcha({
    super.key,
    required this.device,
    required this.service,
    this.account = "123132",
  });

  @override
  State<Captcha> createState() => _CaptchaState();
}

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 3;

class _CaptchaState extends State<Captcha> {
  final TextEditingController _controller = TextEditingController();
  final int _length = 6;
  bool _isPhone = false;

  @override
  void initState() {
    _isPhone = widget.device == CaptchaDeviceType.phone;
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
                _isPhone ? _buildPhoneTextField() : _buildEmailTextField(),
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
    if (_isPhone) {
      return widget.account.replaceRange(
        3,
        widget.account.length - 4,
        List.generate(widget.account.length - 7, (index) => "*").join(""),
      );
    }
    var index = widget.account.indexOf("@");
    return widget.account.replaceRange(
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
            context.pop();
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

  _buildPhoneTextField() {
    return UiTextField(
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
      ),
      controller: _controller,
      maxLength: _length,
      decoration: _inputDecoration(),
    );
  }

  _buildEmailTextField() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _controller,
        decoration: _inputDecoration());
  }

  _inputDecoration() {
    return InputDecoration(
      label: Text("$typeText验证码"),
      border: const OutlineInputBorder(),
      suffixIcon: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: CountdownButton(),
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

  send() async {
    var payload = {
      "device": _isPhone ? CaptchaDeviceType.phone : CaptchaDeviceType.email,
      "session": widget.service,
    };
    // 如果value不存在，则视为未登录
    if (widget.account == null) {
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
