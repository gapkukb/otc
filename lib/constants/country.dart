enum Country {
  CN(text: "中国"),
  JP(text: "日本"),
  KR(text: "韩国"),
  PH(text: "菲律宾"),
  MY(text: "马来西亚"),
  SG(text: "新加坡"),
  AU(text: "澳大利亚"),
  DE(text: "德国"),
  GB(text: "英国"),
  US(text: "美国");

  const Country({
    required this.text,
  });

  final String text;
}
