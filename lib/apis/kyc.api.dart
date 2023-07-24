part of apis;

class _KycApi {
  /// 申请初级认证
  final authLv1 = post("/customer/kyc/apply/auth/lv1");

  /// 申请中级认证
  final authLv2 = post("/customer/kyc/apply/auth/lv2");

  /// 申请高级认证
  final authLv3 = post("/customer/kyc/apply/auth/lv3");
}

final kycApi = _KycApi();
