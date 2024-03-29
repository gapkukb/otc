part of apis;

class _Wallet {
  /// 查询用户所有钱包的明细
  final currenciesDetails = get("/customer/wallet/balance-details");

  /// 查询用户所有钱包的额度
  final currenciesBalances = get("/customer/wallet/balances");

  /// 查询用户某个钱包的额度
  final currencyBalance = get("/customer/wallet/balance/:currency");

  /// 查询用户某个钱包的明细
  final currencyDetails = get("/customer/wallet/balance-details/:currency");

  /// 站内转账
  final transfer = post("/customer/wallet/transfer");

  /// 站内转账记录

  final transferRecords = post("/customer/wallet/transfer/records", (Map<String, dynamic> json) {
    return PaginationModel.fromJson(json, (item) => WalletTransferHistoryModel.fromJson(item as dynamic));
  }, HttpOptions(loading: false));

  /// 查询用户所有银行卡
  final getAllBankCards = get<List<dynamic>>(
    "/customer/bankcard/list",
  );

  /// 添加银行卡
  final addBankCard = post("/customer/bankcard/add");

  /// 删除银行卡
  final deleteBankCard = post("/customer/bankcard/delete");

  /// 更新银行卡
  final updateBankCard = post("/customer/bankcard/edit");

  /// 设置默认银行卡
  final setDefaultBankCard = post("/customer/bankcard/set-default");

  /// 查询用户所有二维码
  final getAllQRcode = post<List<dynamic>>("/customer/qrcode/list");

  /// 新增二维码
  final addQRcode = post("/customer/qrcode/add");

  /// 新增二维码
  final deleteQRcode = post("/customer/qrcode/delete");

  /// 查询用户所有地址簿
  final getAddressBook = get("/customer/address-book/list");

  // /// 查询用户所有地址簿
  // final updateAddress =
  //     get<List<Map<String, Object>>>("/customer/address-book/edit");

  /// 查询用户所有地址簿
  final addAddress = post("/customer/address-book/add");

  /// 删除地址簿
  final deleteAddress = post("/customer/address-book/delete");

  /// 删除地址簿
  final getDepositAddress = post("/payment/deposit/address");

  /// 区块链转账订单记录
  final blockchainHistory = post("/payment/records", (Map<String, dynamic> json) {
    return PaginationModel.fromJson(json, (item) => WalletBlockchainHistoryModel.fromJson(item as dynamic));
  }, HttpOptions(loading: false));

  /// 填写地址-申请提款
  final withdrawWithoutBook = post("/payment/withdraw/apply");

  /// 使用地址簿-申请提款
  final withdrawWithBook = post("/payment/withdraw/apply/with-book");

  /// 所有支持的银行
  final supportedBanks = get("/customer/bankcard/support");

  /// 存取最小值
  final transferLimit = get("/payment/limit");
}

final walletApi = _Wallet();
