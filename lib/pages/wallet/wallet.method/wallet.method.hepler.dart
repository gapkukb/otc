enum AddType {
  bank("BANK_CARD_TRANSFER"),
  alipay("ALIPAY_TRANSFER"),
  wechat("WECHAT_TRANSFER");

  const AddType(this.type);

  final String type;
}
