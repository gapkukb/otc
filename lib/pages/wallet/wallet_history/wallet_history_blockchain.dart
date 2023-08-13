import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.provider.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_blockchain_filter.dart';
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
  Map<String, dynamic> filters = {};
  final formKey = GlobalKey<FormState>();
  int pageCount = 1;
  int pageNo = 1;
  final pageSize = 50;

  @override
  void initState() {
    super.initState();

    updateFilters();
  }

  updateFilters() {
    final begin = dateFormatter.format(DateTime.now().subtract(Duration(days: formState["datetime"] ?? 7)));
    filters.addAll({
      "deposit": formState["deposit"] ?? true,
      "currency": formState["currency"] ?? Cryptocurrency.USDT.name,
      "reference": formState["reference"],
      "confirmed": formState["confirmed"] == "" ? null : formState["confirmed"],
      "page": pageNo,
      "pageSize": pageSize,
      "begin": "$begin 00:00:00",
      "end": "${dateFormatter.format(DateTime.now())} 23:59:59",
    });
  }

  maskText(String text) {
    return "${text.substring(0, 3)}...${text.substring(text.length - 3)}";
  }

  @override
  Widget build(context) {
    final provider = ref.watch(
      blockchainHisotryProvider(filters),
    );

    return provider.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (_, __) => Text(_.toString() + __.toString()),
      data: (data) {
        pageCount = data.pages;
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletHistoryBlockchainFilter(
                onSearch: () async {
                  formKey.currentState!.save();
                  setState(() {
                    pageNo = 1;
                    updateFilters();
                    return ref.refresh(blockchainHisotryProvider(filters));
                  });
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
                          DataColumn2(label: Text("时间"), fixedWidth: 160),
                          DataColumn2(label: Text("类型")),
                          DataColumn2(label: Text("资产")),
                          DataColumn2(label: Text("数量")),
                          DataColumn2(label: Text("打款地址")),
                          DataColumn2(label: Text("收款地址")),
                          DataColumn2(label: Text("Txid")),
                          DataColumn2(label: Text("状态")),
                        ],
                        columnSpacing: 4,
                        dividerThickness: 0.001,
                        empty: provider.isLoading ? null : const UiEmptyView(),
                        rows: data.records.map((row) {
                          return DataRow(cells: [
                            DataCell(Text(row.createdTime)),
                            DataCell(Text(row.deposit ? "充值" : "提币")),
                            DataCell(Text(row.currency)),
                            DataCell(Text(row.amount.decimalize())),
                            DataCell(UiClipboard(
                              text: row.fromAddress,
                              iconSize: 16,
                              child: Text(maskText(row.fromAddress)),
                            )),
                            DataCell(UiClipboard(
                              text: row.toAddress,
                              iconSize: 16,
                              child: Text(maskText(row.toAddress)),
                            )),
                            DataCell(UiClipboard(
                              text: row.transactionHash,
                              iconSize: 16,
                              child: Text(maskText(row.transactionHash)),
                            )),
                            DataCell(Text(row.confirmed == "YES" ? "已完成" : "待确认")),
                          ]);
                        }).toList(),
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
              ),
              Pagination(
                pageCount: pageCount,
                pageNo: pageNo,
                // disabled: loading,
                onChange: (current) {
                  setState(() {
                    pageNo = current;
                    updateFilters();
                    return ref.refresh(blockchainHisotryProvider(filters));
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
