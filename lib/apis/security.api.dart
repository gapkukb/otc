part of apis;

class _SecurityApi {
  final login = get("/auth/login");

  /// 未登录（注册，忘记密码）情况下校验验证码
  final validateOpenCaptcha = post("/captcha/open/valid");

  /// 已登录情况下校验验证码
  final validateCaptcha = post("/captcha/valid");

  /// 通过谷歌验证器获取认证token
  final validateF2A = get("/customer/safety/google/valid");

  /// 通过谷歌验证器获取认证token
  final refreshToken = get("/auth/refresh", null, HttpOptions(loading: false));
}

final securityApi = _SecurityApi();
