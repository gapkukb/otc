part of apis;

class _SecurityApi {
  final login = get("/auth/login");
}

final securityApi = _SecurityApi();
