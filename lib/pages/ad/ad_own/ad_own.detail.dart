part of ad_own;

class AdOwnDetail extends StatefulWidget {
  final List<AdMyTakerModel> detail;

  const AdOwnDetail({
    super.key,
    required this.detail,
  });

  @override
  State<AdOwnDetail> createState() => _AdOwnDetailState();
}

class _AdOwnDetailState extends State<AdOwnDetail> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.8,
            height: constraints.maxHeight * 0.8,
            child: DataTable2(
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
                DataColumn2(label: Text("操作"), fixedWidth: 140),
              ],
              columnSpacing: 4,
              dataRowHeight: 60,
              empty: const UiEmptyView(),
              rows: widget.detail.map((row) {
                return DataRow(cells: [
                  DataCell(Text("${row.reference}\n${Cryptocurrency.getByName(row.coin)!.name}/${Fiatcurrency.getByName(row.money)!.text}")),
                  DataCell(Text(row.sell ? "出售" : "购买")),
                  DataCell(Text(row.coinAmount.toString())),
                  DataCell(Text(row.moneyAmount.toString())),
                  DataCell(Text(row.rate.toString())),
                  DataCell(Text(PaymentMethods.getByValue(row.paymentMethod).text)),
                  DataCell(Text(row.takerPaymentAccount)),
                  DataCell(Text(AdOwnState.getByValue(row.state).text)),
                  DataCell(Text(row.createdTime)),
                  DataCell(stateButton(context, row)),
                ]);
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  stateButton(BuildContext context, AdMyTakerModel row) {
    if (row.state == AdOwnState.NOTIFIED.name) {
      return Wrap(
        // direction: Axis.vertical,
        spacing: 4,
        children: [
          UiButton(
            label: "确认收款",
            size: UiButtonSize.mini,
            onPressed: () {
              confirm(true, row);
            },
          ),
          UiButton(
            label: "确认未收款",
            size: UiButtonSize.mini,
            color: Colors.red,
            onPressed: () {
              confirm(false, row);
            },
          )
        ],
      );
    }

    return const SizedBox.shrink();
  }

  confirm(bool receipted, AdMyTakerModel row) async {
    await apis.otc.confirm({
      "reference": row.reference,
      "receipted": receipted,
    });

    final index = widget.detail.indexWhere((element) => element == row);

    setState(() {
      widget.detail[index] = row.copyWith(
        state: receipted ? AdOwnState.PAID.name : AdOwnState.CANCELED.name,
      );
    });
  }
}
