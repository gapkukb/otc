part of apis;

class _Agent {
  /// 查询返佣比例
  final getSetting = get("/agent/commission/setting", MerchantSettingModel.fromJson);

  /// 邀请码列表
  final getInvitionCode = post("/agent/inv-code/page", (Map<String, dynamic> json) {
    return PaginationModel.fromJson(json, (item) => MerchantInvitationModel.fromJson(item as dynamic));
  }, HttpOptions(loading: false));

  /// 修改返佣比例
  final updateSetting = post("/agent/commission/setting/modify");

  /// 仪表盘
  final getDashboard = get("/agent/dashboard");
}

final agentApi = _Agent();
