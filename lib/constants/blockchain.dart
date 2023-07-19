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
  ),
  ETH(
    title: "BNB Smart Chain (BEP20)",
    subTitle: "Binance Smart Chain",
    duration: 1,
    protocal: Protocal.BEP20,
  ),
  TRON(
    title: "Tron (TRC20)",
    subTitle: "Tron (TRX)",
    duration: 1,
    protocal: Protocal.TRC20,
  );

  const BlockChain({
    required this.title,
    required this.subTitle,
    required this.duration,
    required this.protocal,
  });
  final String title;
  final String subTitle;
  final double duration;
  final Protocal protocal;
}
