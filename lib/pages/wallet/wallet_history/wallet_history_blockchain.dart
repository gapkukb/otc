import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/table/table.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.provider.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_filter.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/date_time.dart';

class WalletHistoryBlockchain extends ConsumerStatefulWidget {
  const WalletHistoryBlockchain({super.key});

  @override
  ConsumerState<WalletHistoryBlockchain> createState() => _WalletHistoryBlockchainState();
}

class _WalletHistoryBlockchainState extends ConsumerState<WalletHistoryBlockchain> {
  final Map<String, dynamic> formState = {};
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          WalletHistoryFilter(
            onSearch: () {
              formKey.currentState!.save();
              inspect(formState);
            },
            formState: formState,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: DataGrid(
                pageSize: 20,
                fetcher: (pageNo, pageSize) async {
                  formKey.currentState!.save();

                  return Future<List<String>>(() async {
                    return await apis.wallet.blockchainHistory({
                      "page": pageNo,
                      "pageSize": pageSize,
                      "begin": dateFormatter.format(DateTime.now()),
                      "end": "",
                      "deposit": true,
                      "currency": "",
                      "reference": "",
                      "confirmed": "",
                    }) as List<String>;
                  });
                },
                columns: [
                  DataGridColumn(
                    columnName: "time",
                    title: "时间",
                    getValue: (row) => "",
                  ),
                  DataGridColumn(
                    columnName: "time",
                    title: "类型",
                    getValue: (row) => "",
                  ),
                  DataGridColumn(
                    columnName: "time",
                    title: "资产",
                    getValue: (row) => "",
                  ),
                  DataGridColumn(
                    columnName: "time",
                    title: "数量",
                    getValue: (row) => "",
                  ),
                  DataGridColumn(
                    columnName: "address",
                    title: "地址",
                    getValue: (row) => "",
                  ),
                  DataGridColumn(
                    columnName: "time",
                    title: "Txid",
                    getValue: (row) => "",
                  ),
                  DataGridColumn(
                    columnName: "time",
                    title: "状态",
                    getValue: (row) => "",
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
      ),
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
