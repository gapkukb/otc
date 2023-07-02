part of apis;

class _User {
  final login = get("/");
  final logout = get("/");
  final register = get("/auth/register");
  final getInfo = get("/");
  //未登录时获取验证码
  final sendCaptchaWithLogout = post("/captcha/no-login/send");
  //已登录时获取验证码
  final sendCaptcha = post("/captcha/send");
  final sendSMS = get("/");
  final sendEmail = get("/");
  final sendF2A = get("/");
}

final userApi = _User();
