enum AddType {
  bank("BANK_CARD_TRANSFER", "银行卡"),
  alipay("ALIPAY_TRANSFER", "支付宝"),
  wechat("WECHAT_TRANSFER", "微信");

  const AddType(this.type, this.chinese);

  final String type;
  final String chinese;
}
