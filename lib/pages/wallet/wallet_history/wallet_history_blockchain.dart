import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:otc/components/table/table.dart';
import 'package:otc/models/wallet.blockchain.history/wallet.blockchain.history.model.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.provider.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_filter.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.provider.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_clipboard.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletHistoryBlockchain extends ConsumerStatefulWidget {
  const WalletHistoryBlockchain({super.key});

  @override
  ConsumerState<WalletHistoryBlockchain> createState() => _WalletHistoryBlockchainState();
}

class _WalletHistoryBlockchainState extends ConsumerState<WalletHistoryBlockchain> {
  final Map<String, dynamic> formState = {};
  final formKey = GlobalKey<FormState>();
  int pageNo = 1;
  int pageCount = 1;
  final int PageSize = 20;
  final source = SourceData(count: 0);
  bool loading = true;

  Map<String, dynamic> get filters {
    return formState;
  }

  @override
  Widget build(context) {
    final provider = ref.watch(blockchainHisotryProvider(formState));
    provider.maybeWhen(orElse: () => loading = false);
    provider.whenData((data) {});
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WalletHistoryFilter(
            onSearch: () async {
              formKey.currentState!.save();
              formState['pageNo'] = 1;
              return ref.refresh(blockchainHisotryProvider(formState));
            },
            formState: formState,
          ),
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columns: const [
                      DataColumn2(label: Text('Avatar')),
                      DataColumn2(label: Text('ID')),
                      DataColumn2(label: Text('Name')),
                      DataColumn2(label: Row(children: [Text('Price'), SizedBox(width: 5.0), Icon(Icons.airplanemode_active)])),
                      DataColumn2(label: Text('No.')),
                      DataColumn2(label: Text('Address'))
                    ],
                    columnSpacing: 4,
                    dividerThickness: 0.001,
                    empty: const UiEmptyView(),
                    rows: [],
                  ),
                ),
                if (provider.isLoading)
                  const Positioned(
                    child: Material(
                      color: Colors.white30,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
              ],
            ),

            // child: DataGrid<WalletBlockchainHistoryModel>(
            //   key: key,
            //   pageSize: 3,
            //   fetcher: (pageNo, pageSize) async {
            //     formKey.currentState!.save();
            //     final begin = dateFormatter.format(DateTime.now().subtract(Duration(days: formState["datetime"])));
            //     return await apis.wallet.blockchainHistory({
            //       ...formState,
            //       "page": pageNo,
            //       "pageSize": pageSize,
            //       "begin": "$begin 00:00:00",
            //       "end": "${dateFormatter.format(DateTime.now())} 23:59:59",
            //     });
            //   },
            //   columns: [
            //     DataGridColumn(
            //       columnName: "time",
            //       title: "时间",
            //       getValue: (row) => row.createdTime,
            //     ),
            //     DataGridColumn(
            //       columnName: "type",
            //       title: "类型",
            //       getValue: (row) => row.deposit ? "充值" : "提币",
            //     ),
            //     DataGridColumn(
            //       columnName: "assets",
            //       title: "资产",
            //       getValue: (row) => row.currency,
            //     ),
            //     DataGridColumn(
            //       columnName: "amount",
            //       title: "数量",
            //       getValue: (row) => row.amount.decimalize(),
            //     ),
            //     DataGridColumn(
            //       columnName: "fromAddress",
            //       title: "打款地址",
            //       getValue: (row) => row.fromAddress,
            //       getWidget: (value) => UiClipboard(
            //         text: value,
            //         iconSize: 16,
            //         child: Text(maskText(value)),
            //       ),
            //     ),
            //     DataGridColumn(
            //       columnName: "toAddress",
            //       title: "收款地址",
            //       getValue: (row) => row.toAddress,
            //       getWidget: (value) => UiClipboard(
            //         text: value,
            //         iconSize: 16,
            //         child: Text(maskText(value)),
            //       ),
            //     ),
            //     DataGridColumn(
            //       columnName: "txid",
            //       title: "Txid",
            //       getValue: (row) => row.transactionHash,
            //       getWidget: (value) => UiClipboard(
            //         text: value,
            //         iconSize: 16,
            //         child: Text(maskText(value)),
            //       ),
            //     ),
            //     DataGridColumn(
            //       columnName: "status",
            //       title: "状态",
            //       getValue: (row) => row.confirmed == "YES" ? "已完成" : "待确认",
            //     ),
            //   ],
            // ),
          ),
          Pagination(
            pageCount: 10,
            pageNo: pageNo,
            disabled: loading,
            onChange: (current) {
              setState(() {
                pageNo = current;
              });
              return ref.refresh(blockchainHisotryProvider(formState));
            },
          ),
        ],
      ),
    );
  }

  maskText(String text) {
    return "${text.substring(0, 3)}...${text.substring(text.length - 3)}";
  }
}

class SourceData extends DataTableSource {
  final int count;
  SourceData({
    required this.count,
  });
  final List<Map<String, dynamic>> _sourceData = List.generate(
      200,
      (index) => {
            "avatar": (index % 3 == 1)
                ? 'images/icon_hzw01.jpg'
                : (index % 3 == 2)
                    ? 'images/icon_hzw03.jpg'
                    : 'images/icon_music.png',
            "id": (index + 1),
            "name": "Item Name ${(index + 1)}",
            "price": Random().nextInt(10000),
            "no.": Random().nextInt(10000),
            "address": (index % 3 == 1)
                ? 'Beijing'
                : (index % 3 == 2)
                    ? 'New York'
                    : 'Los Angeles'
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => count;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow? getRow(int index) {
    if (index >= _sourceData.length) {
      notifyListeners();
      return null;
    }

    final item = _sourceData[index];

    return DataRow(
      cells: [
        DataCell(CircleAvatar(backgroundImage: AssetImage(item["avatar"]))),
        DataCell(Text(item['id'].toString())),
        DataCell(Text(item['name'])),
        DataCell(Text('\$ ${item['price']}')),
        DataCell(Text(item['no.'].toString())),
        DataCell(Text(item['address'].toString()))
      ],
    );
  }

  addData(dynamic data) {
    _sourceData.addAll(data);
    notifyListeners();
  }
}
