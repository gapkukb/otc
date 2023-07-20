part of apis;

class _Agent {
  /// 查询返佣比例
  final getAgentSetting = post("/agent/commission/setting");
  // 邀请码列表
  final getInvitionCode = post("/agent/inv-code/page");
}

final agentApi = _Agent();
