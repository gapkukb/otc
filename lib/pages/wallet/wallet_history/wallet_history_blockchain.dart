import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/table/table.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_filter.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_clipboard.dart';

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
            child: DataGrid<_Mock>(
              fetcher: (pageNo, pageSize) async {
                await Future.delayed(const Duration(seconds: 3));
                return List.generate(
                    10,
                    (index) => _Mock(
                        Txid: "Txid",
                        address: "address",
                        amount: "amount",
                        currencyType: "currencyType",
                        dateTime: "dateTime",
                        status: "status",
                        type: "type"));
              },
              columns: [
                DataGridColumn(
                  columnName: "time",
                  title: "时间",
                  getValue: (row) => row.dateTime,
                ),
                DataGridColumn(
                  columnName: "time",
                  title: "类型",
                  getValue: (row) => row.type,
                ),
                DataGridColumn(
                  columnName: "time",
                  title: "资产",
                  getValue: (row) => row.currencyType,
                ),
                DataGridColumn(
                  columnName: "time",
                  title: "数量",
                  getValue: (row) => row.amount,
                ),
                DataGridColumn(
                  columnName: "address",
                  title: "地址",
                  getValue: (row) => row.address,
                ),
                DataGridColumn(
                  columnName: "time",
                  title: "Txid",
                  getValue: (row) => row.Txid,
                ),
                DataGridColumn(
                  columnName: "time",
                  title: "状态",
                  getValue: (row) => row.status,
                ),
              ],
              buildCell: (cell) {
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    cell.value.toString(),
                    style: Font.large,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class _Mock {
  String dateTime;
  String type;
  String currencyType;
  String amount;
  String address;
  String Txid;
  String status;

  _Mock({
    required this.dateTime,
    required this.type,
    required this.currencyType,
    required this.amount,
    required this.address,
    required this.Txid,
    required this.status,
  });
}
