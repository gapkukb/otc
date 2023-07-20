part of apis;

class _Agent {
  /// 查询返佣比例
  final getAgentSetting = post("/agent/commission/setting");
}

final agentApi = _Agent();
