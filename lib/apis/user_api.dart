part of apis;

class _User {
  final login = get("/");
  final logout = get("/");
  final register = get("/auth/register");
  final getInfo = get("/");
  final verify = get("/");
  final sendSMS = get("/");
  final sendEmail = get("/");
  final sendF2A = get("/");
}

final userApi = _User();
