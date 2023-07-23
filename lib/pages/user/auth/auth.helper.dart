part of auth;

enum AuthStatus {
  unlevel(
    text: "未认证",
  ),
  level_1(
    text: "初级认证",
  ),
  level_2(
    text: "中级认证",
  ),
  level_3(
    text: "高级认证",
  );

  const AuthStatus({
    required this.text,
  });

  final String text;

  handler() {}
}
