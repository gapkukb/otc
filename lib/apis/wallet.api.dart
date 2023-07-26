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
  final transfer = get("/customer/wallet/transfer");

  /// 站内转账记录
  final transferRecords = get("/customer/wallet/transfer/records");

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
  final addQRcode = post<List<Map<String, dynamic>>>("/customer/qrcode/add");

  /// 新增二维码
  final deleteQRcode = post<List<Map<String, dynamic>>>("/customer/qrcode/delete");

  /// 查询用户所有地址簿
  final getAddressBook = get<List<dynamic>>("/customer/address-book/list");

  // /// 查询用户所有地址簿
  // final updateAddress =
  //     get<List<Map<String, Object>>>("/customer/address-book/edit");

  /// 查询用户所有地址簿
  final addAddress = post("/customer/address-book/add");

  /// 删除地址簿
  final deleteAddress = post("/customer/address-book/delete");
}

final walletApi = _Wallet();
