part of apis;

class _SecurityApi {
  final login = get("/auth/login");

  /// 通过手机或者邮箱验证器获取认证token
  final validateCaptcha = post("/captcha/valid");

  /// 通过谷歌验证器获取认证token
  final validateF2A = get("/customer/safety/google/valid");
}

final securityApi = _SecurityApi();
