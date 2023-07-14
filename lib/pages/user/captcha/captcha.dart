import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/code_field/code_field.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/global/global.dart';
import 'package:otc/utils/string.dart';

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
  register("register"),

  /// 客户端定义的验证渠道，用于兼容谷歌验证器
  addF2A("addF2A");

  const CaptchaServiceType(this.value);

  final String value;
}

class Captcha extends StatefulWidget {
  final CaptchaDeviceType device;
  final CaptchaServiceType service;
  final String? account;
  final bool autoStart;
  final bool switchable;

  const Captcha({
    super.key,
    required this.device,
    required this.service,
    this.account,
    this.autoStart = false,
    this.switchable = true,
  });

  @override
  State<Captcha> createState() => _CaptchaState();
}

class _CaptchaState extends State<Captcha> {
  final textController = TextEditingController();
  final controller = CountdownTimerController(
    endTime: DateTime.now().millisecondsSinceEpoch,
  );

  final int _length = 6;

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

  String get device {
    return _isPhone
        ? CaptchaDeviceType.phone.value
        : CaptchaDeviceType.email.value;
  }

  getType(bool isphone) {
    return isphone ? '手机' : '邮箱';
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      nextText: "下一步",
      title: "$typeText验证",
      onCompelete: () {
        if (textController.text.length != _length) {
          Modal.showText(text: "请输入6位验证码");
          return;
        }
        context.pop({
          "device": device,
          "code": textController.text,
        });
        Modal.showText(text: "谷歌验证器绑定成功");
      },
      children: [
        Text(
          typeText,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xff667086),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "请输入您在$typeText$maskingAccount收到的6位验证码，验证码30分钟有效",
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff667086),
          ),
        ),
        const SizedBox(height: 24),
        CodeField(
          textController: textController,
          onPressed: send,
        ),
        _buildToggleButton(),
      ],
    );
  }

  // 脱敏
  String get maskingAccount {
    if (_isPhone) {
      return maskPhoneNumber(widget.account ?? global.user?.phone);
    }
    return maskEmail(widget.account ?? global.user?.email);
  }

  _buildToggleButton() {
    if (widget.service == CaptchaServiceType.register || !widget.switchable) {
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
  }
}
