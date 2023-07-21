part of captha;

enum CaptchaDeviceType {
  f2a("F2A", "谷歌身份验证器"),
  phone("PHONE", "手机"),
  email("EMAIL", "邮箱");

  /// 客户端定义的验证渠道，用于兼容谷歌验证器

  const CaptchaDeviceType(this.value, this.chineseText);

  final String value;
  final String chineseText;

  isValid(UserBaseModel? user) {
    if (user == null) return false;
    if (this == email) return user.emailValid;
    if (this == phone) return user.phoneValid;
    return true;
  }
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
  register("register"),
  boundDevice("bound-device"),
  boundPhone("bound-phone"),
  applyGoogleAuth("apply-google-auth"),
  boundFunds("bound-funds"),
  forget("forget"),
  // 客户端自定义类型 - 添加谷歌验证器
  addF2A("addF2A"),
  // 客户端自定义类型 - 验证资金密码
  funds("funds");

  const CaptchaServiceType(this.value);

  final String value;

  FutureOr validate(
    String device,
    String captcha,
  ) {
    switch (this) {
      case boundDevice:
      case boundPhone:
        return apis.user.validateBindDevice({
          "device": device,
          "captcha": captcha,
        });
      case addF2A:
        return apis.user.validateF2A({
          "device": device,
          "captcha": captcha,
        });
      case CaptchaServiceType.boundFunds:
        return apis.user.updatePayPwd({
          "device": device,
        });
      // case CaptchaServiceType.delBankcard:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.addAddressBook:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.editAddressBook:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.delAddressBook:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.addQrcode:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.editQrcode:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.delQrcode:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.boundEmail:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.boundPhone:
      //   return apis.user.validateBindDevice;
      // case CaptchaServiceType.register:
      //   return apis.user.validateBindDevice;
      default:
        return Future.value();
    }
  }

  // FutureOr getCode(
  //   String device,
  //   String captcha,
  // ) {
  //   switch (this) {
  //     case addF2A:
  //       return apis.user.applyF2A({"device": device});
  //     case register:

  //     default:
  //       return Future.value();
  //   }
  // }
}

mixin CaptchaController {
  TextEditingController _controller = TextEditingController();

  final int _length = 6;

  late CaptchaDeviceType _mode;

  String get device {
    return _mode.value;
  }

  paste() async {
    final code = await FlutterClipboard.paste();
    _controller.text = code;
  }
}
