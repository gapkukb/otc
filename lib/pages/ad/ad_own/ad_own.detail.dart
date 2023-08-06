part of ad_own;

class AdOwnDetail extends StatelessWidget {
  final List<AdMyTakerModel> detail;
  const AdOwnDetail({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      child: DataTable2(
        columns: const [
          DataColumn2(label: Text("广告编号\n币种/法币")),
          DataColumn2(label: Text("类型")),
          DataColumn2(label: Text("已成交数量")),
          DataColumn2(label: Text("已成交价格")),
          DataColumn2(label: Text("汇率")),
          DataColumn2(label: Text("支付方式")),
          DataColumn2(label: Text("买方姓名")),
          DataColumn2(label: Text("状态")),
          DataColumn2(label: Text("创建时间")),
          DataColumn2(label: Text("操作")),
        ],
        columnSpacing: 4,
        dataRowHeight: 60,
        empty: const UiEmptyView(),
        rows: List.generate(10, (index) => index.toString()).map((row) {
          return DataRow(cells: [
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
            DataCell(Text(row)),
          ]);
        }).toList(),
      ),
    );
  }
}
