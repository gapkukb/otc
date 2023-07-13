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
  final applyMaker = get("/customer/maker/apply");

  /// 上传头像
  final uploadAvatar = get("/upload/avatar");
}

final userApi = _User();
