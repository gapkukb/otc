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
  final getUser = get("/customer", UserModel.fromJson);

  /// 获取用户详细信息
  final getUserDetail = get("/customer/detail");

  /// 未登录时获取验证码
  final sendCaptchaWithLogout = post("/captcha/no-login/send");

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
  final getUserLog = get("/customer/login-log/last/{num}");

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
}

final userApi = _User();
