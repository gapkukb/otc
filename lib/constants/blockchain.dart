enum BlockChain {
  BSC(
    title: "Ethereum (ERC20)",
    subTitle: "Ethereum (ETH)",
    duration: 5,
  ),
  ETH(
    title: "BNB Smart Chain (BEP20)",
    subTitle: "Binance Smart Chain",
    duration: 1,
  ),
  TRON(
    title: "Tron (TRC20)",
    subTitle: "Tron (TRX)",
    duration: 1,
  );

  const BlockChain({
    required this.title,
    required this.subTitle,
    required this.duration,
  });
  final String title;
  final String subTitle;
  final double duration;
}
