part of ad_own;

class AdOwnDetail extends StatefulWidget {
  final List<AdMyTakerModel> detail;
  final List<AdMyChannleModel> channels;
  final Function() onRefresh;

  const AdOwnDetail({
    super.key,
    required this.detail,
    required this.onRefresh,
    required this.channels,
  });

  @override
  State<AdOwnDetail> createState() => _AdOwnDetailState();
}

class _AdOwnDetailState extends State<AdOwnDetail> {
  // 由于数据不可变，这里使用新的数组装载
  List<AdMyTakerModel> rowsData = [];

  @override
  void initState() {
    rowsData = [...widget.detail];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final List<DataRow> rows = [];
          for (final (index, row) in rowsData.indexed) {
            final rowWidget = DataRow(cells: [
              DataCell(Text("${row.reference}\n${Cryptocurrency.getByName(row.coin)!.name}/${Fiatcurrency.getByName(row.money)!.text}")),
              DataCell(Text(row.sell ? "出售" : "购买")),
              DataCell(Text(row.coinAmount.toString())),
              DataCell(Text(row.moneyAmount.toString())),
              DataCell(Text(row.rate.toString())),
              DataCell(Text(PaymentMethods.getByValue(row.paymentMethod).text)),
              DataCell(Text(row.takerAccountName.toString())),
              DataCell(AdOwnState.getWidgetByValue(row.state)),
              DataCell(Text(row.createdTime)),
              DataCell(stateButton(context, row, index)),
            ]);
            rows.add(rowWidget);
          }
          return SizedBox(
            width: constraints.maxWidth * 0.8,
            height: constraints.maxHeight * 0.8,
            child: DataTable2(
              headingTextStyle: Font.miniGrey,
              columns: const [
                DataColumn2(label: Text("广告编号\n币种/法币"), fixedWidth: 200),
                DataColumn2(label: Text("类型")),
                DataColumn2(label: Text("已成交数量")),
                DataColumn2(label: Text("已成交价格")),
                DataColumn2(label: Text("汇率")),
                DataColumn2(label: Text("支付方式")),
                DataColumn2(label: Text("买方姓名")),
                DataColumn2(label: Text("状态")),
                DataColumn2(label: Text("创建时间"), fixedWidth: 180),
                DataColumn2(label: Text("操作"), fixedWidth: 150),
              ],
              columnSpacing: 4,
              dataRowHeight: 60,
              empty: const UiEmptyView(),
              rows: rows,
            ),
          );
        },
      ),
    );
  }

  stateButton(BuildContext context, AdMyTakerModel row, int index) {
    if (row.state == AdOwnState.NOTIFIED.name) {
      return CountdownTimer(
        endTime: row.overTime == null ? null : dateFormatter.parse(row.overTime!).millisecondsSinceEpoch,
        widgetBuilder: (context, time) {
          final timeText = time == null ? "" : "\n${addZero(time.hours)}:${addZero(time.min)}:${addZero(time.sec)}";
          final channel = widget.channels.firstWhere((element) => element.reference == row.makerChannelReference);
          return Wrap(
            spacing: 4,
            children: [
              UiButton(
                size: UiButtonSize.mini,
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      final text = time == null ? "00:00" : "${addZero(time.min)}:${addZero(time.sec)}";
                      return ModalPageTemplate(
                        title: "确认收款",
                        onCompelete: (context) async {
                          await confirm(true, row, index);
                          Navigator.of(context).maybePop();
                        },
                        children: [
                          _Cell(titleText: "广告编号", trailingText: row.reference),
                          _Cell(titleText: "倒计时", trailingText: text),
                          _Cell(titleText: "汇率", trailingText: row.rate.toString()),
                          _Cell(titleText: "成交数量", trailingText: row.coinAmount.toString()),
                          _Cell(titleText: "成交价格", trailingText: "￥${row.moneyAmount}"),
                          _Cell(titleText: "支付方式", trailingText: PaymentMethods.getByValue(row.paymentMethod).text),
                          _Cell(titleText: "币种/法币", trailingText: "${row.coin}/${row.money}"),
                          PaymentCard(info: row, channel: channel),
                          const Divider(thickness: 1, height: 17),
                          const Text("确认收款后将会扣除账户余额并进行佣金结算，确定要收款吗？"),
                        ],
                      );
                    },
                  );
                },
                label: "确认收款$timeText",
              ),
              UiButton(
                size: UiButtonSize.mini,
                color: Colors.red,
                disabled: time != null,
                onPressed: () {
                  Modal.confirm(
                    title: "确认未收款",
                    content: "确认未收款后会取消此广告，确定要取消吗？",
                    onOk: () {
                      confirm(false, row, index);
                    },
                  );
                },
                label: "确认未收款$timeText",
              )
            ],
          );
        },
      );
    }

    return const SizedBox.shrink();
  }

  confirm(bool receipted, AdMyTakerModel row, int index) async {
    final data = await apis.otc.confirm({
      "reference": row.reference,
      "receipted": receipted,
    });

    data['overTime'] = 0;

    setState(() {
      rowsData.replaceRange(index, index + 1, [AdMyTakerModel.fromJson(data)]);
      widget.onRefresh();
    });
  }

  String addZero(num? n) {
    if (n == null) return "00";
    if (n < 10) return "0${n.toString()}";
    return n.toString();
  }
}

class _Cell extends Cell {
  const _Cell({
    super.titleText,
    super.trailingText,
  }) : super(
          height: 28,
          trailingTextStyle: Font.miniGrey,
        );
}

class PaymentCard extends StatelessWidget {
  final AdMyTakerModel info;
  final AdMyChannleModel? channel;
  const PaymentCard({
    super.key,
    required this.info,
    required this.channel,
  });

  @override
  Widget build(BuildContext context) {
    final payment = PaymentMethods.getByValue(info.paymentMethod);
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Pads.xAxisSm,
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: payment.icon,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 8,
                    children: [
                      Text(payment.text),
                      Text(channel?.channelAccount ?? ""),
                      Text(channel?.channelTitle ?? ""),
                    ],
                  ),
                  const Spacer(),
                  if (payment != PaymentMethods.bankCard)
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: QrImageView(
                        data: channel?.channelAccount ?? "",
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
