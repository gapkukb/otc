enum Protocal {
  ERC20,
  BEP20,
  TRC20,
}

enum BlockChain {
  BSC(
    title: "Ethereum (ERC20)",
    subTitle: "Ethereum (ETH)",
    duration: 5,
    protocal: Protocal.ERC20,
    value: "BSC",
    enable: true,
  ),
  ETH(
    title: "BNB Smart Chain (BEP20)",
    subTitle: "Binance Smart Chain",
    duration: 1,
    protocal: Protocal.BEP20,
    value: "ETH",
    enable: true,
  ),
  TRON(
    title: "Tron (TRC20)",
    subTitle: "Tron (TRX)",
    duration: 1,
    protocal: Protocal.TRC20,
    value: "TRON",
    enable: true,
  ),

  BTC(
    title: "Tron (TRC20)",
    subTitle: "Tron (TRX)",
    duration: 1,
    protocal: Protocal.TRC20,
    value: "BTC",
    enable: false,
  );

  static List<BlockChain> get valid {
    return BlockChain.values.where((element) => element.enable).toList();
  }

  const BlockChain({
    required this.title,
    required this.subTitle,
    required this.duration,
    required this.protocal,
    required this.value,
    required this.enable,
  });
  final String title;
  final String subTitle;
  final double duration;
  final Protocal protocal;
  final String value;
  final bool enable;
}
