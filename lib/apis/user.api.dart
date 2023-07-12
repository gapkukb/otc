part of apis;

class _User {
  final login = get("/auth/login");
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
  final modifyNicknam = post("/api/customer/modify/nickname");

  /// 申请成为maker
  final applyMaker = get("/api/customer/maker/apply");

  /// 上传头像
  final uploadAvatar = get("/upload/avatar");
}

final userApi = _User();
