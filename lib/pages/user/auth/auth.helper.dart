part of auth;

/// kyc1最高

enum AuthLevel {
  kyc0(
    title: "未认证",
    withdrawLimit: 0,
    transferLimit: 0,
    requirement: "",
  ),
  kyc1(
    title: "初级认证",
    withdrawLimit: 2000,
    transferLimit: 5000,
    requirement: "要求：1.姓名 2.年龄 3.身份证",
  ),
  kyc2(
    title: "中级认证",
    withdrawLimit: 5000,
    transferLimit: 10000,
    requirement: "要求：1.手持身份证照片",
  ),
  kyc3(
    title: "高级认证",
    withdrawLimit: 10000,
    transferLimit: 50000,
    requirement: "要求：1.手持身份证照片视频",
  ),
  ;

  const AuthLevel({
    required this.title,
    required this.withdrawLimit,
    required this.transferLimit,
    required this.requirement,
  });

  final String title;
  final num withdrawLimit;
  final num transferLimit;
  final String requirement;

  static AuthLevel getByName(bool? lv1, bool? lv2, bool? lv3) {
    if (lv1 == true) return AuthLevel.kyc1;
    if (lv2 == true) return AuthLevel.kyc2;
    if (lv3 == true) return AuthLevel.kyc3;
    return AuthLevel.kyc0;
  }
}
