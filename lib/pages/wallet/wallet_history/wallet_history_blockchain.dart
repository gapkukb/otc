import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_filter.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_clipboard.dart';

List<Map<String, dynamic>> rows = [
  {
    "dateTime": "2022-04-04 13:23:39",
    "type": 0,
    "currencyType": "USDT",
    "amount": 323443.23,
    "address": "0x246....5DAA",
    "Txid": "0x1ea....705b",
    "status": 0,
  },
  {
    "dateTime": "2022-04-04 13:23:39",
    "type": 0,
    "currencyType": "USDT",
    "amount": 323443.23,
    "address": "0x246....5DAA",
    "Txid": "0x1ea....705b",
    "status": 0,
  },
  {
    "dateTime": "2022-04-04 13:23:39",
    "type": 0,
    "currencyType": "USDT",
    "amount": 323443.23,
    "address": "0x246....5DAA",
    "Txid": "0x1ea....705b",
    "status": 0,
  }
];

class WalletHistoryBlockchain extends StatelessWidget {
  const WalletHistoryBlockchain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WalletHistoryFilter(),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: DataTable2(
              dividerThickness: 0.01,
              headingTextStyle:
                  const TextStyle(fontSize: 12, color: Colors.grey),
              dataTextStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xff67748E),
              ),
              columnSpacing: 4,
              columns: const [
                DataColumn2(label: Text("时间"), fixedWidth: 140),
                DataColumn2(label: Text("类型"), fixedWidth: 60),
                DataColumn2(label: Text("资产"), fixedWidth: 60),
                DataColumn2(label: Text("数量")),
                DataColumn2(label: Text("地址")),
                DataColumn2(label: Text("Txid")),
                DataColumn2(label: Text("状态"), fixedWidth: 60),
              ],
              rows: rows
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text(e['dateTime'])),
                        DataCell(Text(e['type'].toString())),
                        DataCell(Text(e['currencyType'])),
                        DataCell(Text((e['amount'] as num).decimalize())),
                        DataCell(UiClipboard(
                          text: e['address'],
                          iconSize: 12,
                          child: Text(
                            e['address'],
                            maxLines: 1,
                          ),
                        )),
                        DataCell(UiClipboard(
                          text: e['Txid'],
                          iconSize: 12,
                          child: Text(
                            e['Txid'],
                            maxLines: 1,
                          ),
                        )),
                        DataCell(Text(e['status'].toString())),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
