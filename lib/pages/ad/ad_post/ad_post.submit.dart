part of ad_post;

Future<bool?> adPostSubmit(BuildContext context, List<Widget> icons, Map<String, dynamic> payload) {
  return showDialog(
    context: context,
    builder: (context) {
      return ModalPageTemplate(
        legend: "发布广告",
        title: "确认发布",
        onCompelete: (context) async {
          await apis.otc.publishAd(payload);
          context.pop(true);
        },
        children: [
          Card(
            child: Padding(
              padding: Pads.sm,
              child: Column(
                children: [
                  _Cell(
                    titleText: "类型",
                    trailingText: payload['sell'] ? "出售" : "购买",
                  ),
                  _Cell(
                    titleText: "币种/法币",
                    trailingText: "${payload['coin']}/${payload['money']}",
                  ),
                  _Cell(
                    titleText: "价格类型",
                    trailingText: payload['fixedRate'] ? "固定价格" : "浮动价格",
                  ),
                  _Cell(
                    titleText: "成交单价",
                    trailingText: "${((payload['refRate'] + payload['floatOffset']) as double).decimalize()} ${payload['coin']}",
                  ),
                  _Cell(
                    titleText: "数量",
                    trailingText: "${(payload['amount'] as String).decimalize()} ${payload['coin']}",
                  ),
                  _Cell(
                    titleText: "成交总价",
                    trailingText: "${(double.parse(payload['amount']) * payload['refRate']).decimalize()} ${payload['money']}",
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.grey.shade100,
            child: Padding(
              padding: Pads.sm,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("收款方式", style: Font.miniGrey),
                        const Gap.mini(),
                        Wrap(
                          spacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: icons,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("支付时效", style: Font.miniGrey),
                        const Gap.mini(),
                        Text(
                          "${(payload['validTime'] / 60 as double).toInt()}分钟",
                          style: Font.smallBold,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    },
  );
}

class _Cell extends Cell {
  const _Cell({
    super.titleText,
    super.trailingText,
  }) : super(
          height: 30,
          trailingTextStyle: Font.miniGrey,
        );
}
