part of apis;

class _User {
  final login = post(
      "/auth/login",
      null,
      HttpOptions(
        dataType: HttpDataType.form,
      ));
  final logout = get("/");
  final register = post("/auth/register");

  /// 获取用户基本信息
  final getUserBase = get("/customer", UserBaseModel.fromJson);

  /// 获取用户详细信息
  final getUser = get("/customer/detail", UserModel.fromJson);

  /// 未登录时获取验证码
  final sendCaptchaWithLogout = post("/captcha/open/send");

  /// 已登录时获取验证码
  final sendCaptcha = post("/captcha/send");

  /// 修改用户头像
  final modifyAvatar = post("/customer/modify/avatar");

  /// 修改用户昵称
  final modifyNickname = post("/customer/modify/nickname");

  /// 申请成为maker
  final applyMaker = post("/customer/maker/apply");

  /// 获取kyc信息
  final getKyc = post("/customer/kyc");

  /// 获取otc配置
  final getOtcConfig = get("/otc/config", OtcModel.fromJson);

  /// 查询最后N条登录记录
  final getUserLog = post("/customer/login-log/last");

  /// 修改登录密码
  final updatePwd = post("/customer/safety/reset/login-pwd");

  /// 申请谷歌验证
  final applyF2A = post("/customer/safety/apply-google-auth");

  /// 校验谷歌验证码
  final validateF2A = post("/customer/safety/valid/apply-google-auth");

  /// 绑定谷歌验证码绑定谷歌验证器
  final bindF2A = post("/customer/safety/valid/google-secret");

  /// 校验修改资金密码
  final authPayPwd = post("/customer/safety/valid/reset/pay-pwd");

  /// 校验修改资金密码
  final updatePayPwd = post("/customer/safety/reset/pay-pwd");

  /// 校验绑定设备(邮箱，手机)
  final validateBindDevice = post("/customer/safety/valid/device");

  /// 申请绑定设备(邮箱，手机)
  final bindDevice = post("/customer/safety/bound/device");
}

final userApi = _User();
