import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/table/table.dart';
import 'package:otc/models/wallet.blockchain.history/wallet.blockchain.history.model.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.provider.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_filter.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_clipboard.dart';

class WalletHistoryBlockchain extends ConsumerStatefulWidget {
  const WalletHistoryBlockchain({super.key});

  @override
  ConsumerState<WalletHistoryBlockchain> createState() => _WalletHistoryBlockchainState();
}

class _WalletHistoryBlockchainState extends ConsumerState<WalletHistoryBlockchain> {
  final Map<String, dynamic> formState = {};
  final formKey = GlobalKey<FormState>();
  var key = UniqueKey();

  @override
  Widget build(context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          WalletHistoryFilter(
            onSearch: () async {
              formKey.currentState!.save();
              setState(() {
                key = UniqueKey();
              });
            },
            formState: formState,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: DataGrid<WalletBlockchainHistoryModel>(
                key: key,
                pageSize: 20,
                fetcher: (pageNo, pageSize) async {
                  formKey.currentState!.save();
                  final begin = dateFormatter.format(DateTime.now().subtract(Duration(days: formState["datetime"])));
                  return await apis.wallet.blockchainHistory({
                    ...formState,
                    "page": pageNo,
                    "pageSize": pageSize,
                    "begin": "$begin 00:00:00",
                    "end": "${dateFormatter.format(DateTime.now())} 23:59:59",
                  }).then((value) => value.records);
                },
                columns: [
                  DataGridColumn(
                    columnName: "time",
                    title: "时间",
                    getValue: (row) => row.createdTime,
                  ),
                  DataGridColumn(
                    columnName: "type",
                    title: "类型",
                    getValue: (row) => row.deposit ? "充值" : "提币",
                  ),
                  DataGridColumn(
                    columnName: "assets",
                    title: "资产",
                    getValue: (row) => row.currency,
                  ),
                  DataGridColumn(
                    columnName: "amount",
                    title: "数量",
                    getValue: (row) => row.amount.decimalize(),
                  ),
                  DataGridColumn(
                    columnName: "fromAddress",
                    title: "打款地址",
                    getValue: (row) => row.fromAddress,
                    getWidget: (value) => UiClipboard(
                      text: value,
                      iconSize: 16,
                      child: Text(maskText(value)),
                    ),
                  ),
                  DataGridColumn(
                    columnName: "toAddress",
                    title: "收款地址",
                    getValue: (row) => row.toAddress,
                    getWidget: (value) => UiClipboard(
                      text: value,
                      iconSize: 16,
                      child: Text(maskText(value)),
                    ),
                  ),
                  DataGridColumn(
                    columnName: "txid",
                    title: "Txid",
                    getValue: (row) => row.transactionHash,
                    getWidget: (value) => UiClipboard(
                      text: value,
                      iconSize: 16,
                      child: Text(maskText(value)),
                    ),
                  ),
                  DataGridColumn(
                    columnName: "status",
                    title: "状态",
                    getValue: (row) => row.confirmed == "YES" ? "已完成" : "待确认",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  maskText(String text) {
    return "${text.substring(0, 3)}...${text.substring(text.length - 3)}";
  }
}
