part of apis;

class _User {
  final login = get("/auth/login");
  final logout = get("/");
  final register = post("/auth/register");
  final getUser = get("/customer");
  final getUserDetail = get("/customer/detail");
  //未登录时获取验证码
  final sendCaptchaWithLogout = post("/captcha/no-login/send");
  //已登录时获取验证码
  final sendCaptcha = post("/captcha/send");
  final sendSMS = get("/");
  final sendEmail = get("/");
  final sendF2A = get("/");
}

final userApi = _User();
