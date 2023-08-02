part of captha;

enum CaptchaDevice {
  f2a("F2A", "谷歌身份验证器"),
  phone("PHONE", "手机"),
  email("EMAIL", "邮箱");

  /// 客户端定义的验证渠道，用于兼容谷歌验证器

  const CaptchaDevice(this.value, this.chineseText);

  final String value;
  final String chineseText;

  isValid(UserBaseModel? user) {
    if (user == null) return false;
    if (this == email) return user.emailValid;
    if (this == phone) return user.phoneValid;
    if (this == f2a) return user.googleSecretValid;
    return false;
  }
}

enum CaptchaSession {
  normal("default"),
  register("register"),
  boundDevice("bound-device"),
  boundFunds("bound-funds"),
  forget("forget"),
  // 客户端自定义类型 - 添加谷歌验证器
  addF2A("addF2A"),
  // 客户端自定义类型 - 验证资金密码
  funds("funds");

  const CaptchaSession(this.value);

  final String value;

  validate(
    CaptchaDevice device,
    String captcha,
    String? account,
  ) {
    switch (this) {
      case boundDevice:
        return apis.user.validateBindDevice({
          "device": device,
          "captcha": captcha,
        });
      case addF2A:
        return apis.user.validateF2A({
          "device": device,
          "captcha": captcha,
        });
      case CaptchaSession.boundFunds:
        return apis.user.updatePayPwd({
          "device": device,
        });
      case CaptchaSession.register:
        return apis.security.validateOpenCaptcha({
          "session": value,
          "device": device.value,
          "captcha": captcha,
          "account": account,
        });
      default:
        if (device == CaptchaDevice.f2a) {
          // 谷歌验证器需要特殊处理
          return apis.security.validateF2A({
            "session": value,
            "authCode": captcha,
          });
        }
        return apis.security.validateCaptcha({
          "session": value,
          "device": device.value,
          "captcha": captcha,
        });
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
