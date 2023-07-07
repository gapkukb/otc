import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class WalletHistoryTrade extends StatelessWidget {
  const WalletHistoryTrade({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: const [
        DataColumn(label: Text("时间")),
        DataColumn(label: Text("类型")),
        DataColumn(label: Text("资产")),
        DataColumn(label: Text("数量")),
        DataColumn(label: Text("地址")),
        DataColumn(label: Text("Txid")),
        DataColumn(label: Text("状态")),
      ],
      rows: [],
    );
  }
}
