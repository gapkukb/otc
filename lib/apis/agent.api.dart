part of apis;

class _Agent {
  /// 查询返佣比例
  final getRebate = post("/agent/commission/setting");

  /// 邀请码列表
  final getInvitionCode = post("/agent/inv-code/page");

  /// 修改返佣比例
  final updateRebate = post("/agent/commission/setting/modify");
}

final agentApi = _Agent();
