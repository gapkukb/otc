library ad_own;

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:otc/components/table/table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/models/ad.my/ad.my.model.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'package:otc/pages/ad/ad_own/ad_own.filters.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'dart:math' as math;

part 'ad_own.provider.dart';

class AdOwn extends StatefulWidget {
  const AdOwn({super.key});

  @override
  State<AdOwn> createState() => _AdOwnState();
}

class _AdOwnState extends State<AdOwn> {
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
      "confirmed": formState["confirmed"] ?? "UNKNOWN",
      "page": pageNo,
      "pageSize": pageSize,
      "begin": "$begin 00:00:00",
      "end": "${dateFormatter.format(DateTime.now())} 23:59:59",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdOwnFilters(
        formState: formState,
        onCompelete: () {},
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(adOwnProvider(filters));
          return provider.when(
            data: (data) {
              return DataTable2(
                columns: const [
                  DataColumn2(label: Text("广告编号\n币种/法币"), fixedWidth: 160),
                  DataColumn2(label: Text("类型")),
                  DataColumn2(label: Text("广告数量\n限额")),
                  DataColumn2(label: Text("已成交数量")),
                  DataColumn2(label: Text("已成交价格")),
                  DataColumn2(label: Text("状态")),
                  DataColumn2(label: Text("创建时间")),
                  DataColumn2(label: Text("操作")),
                  DataColumn2(label: Text(""), fixedWidth: 60),
                ],
                columnSpacing: 4,
                dividerThickness: 0.001,
                empty: provider.isLoading ? null : const UiEmptyView(),
                rows: data.records.map((row) {
                  final min = row.channels.map((e) => e.amountMin).reduce(math.min);
                  final max = row.channels.map((e) => e.amountMax).reduce(math.max);
                  return DataRow(cells: [
                    DataCell(Text("${row.reference}\n${row.currency}/${row.changeCurrency}")),
                    DataCell(Text(row.sell ? "出售" : "购买")),
                    DataCell(Text("${row.amount}\n￥$min - ￥$max")),
                    DataCell(Text(row.totalAmount.toString())),
                    DataCell(Text(row.totalChangeAmount.toString())),
                    DataCell(Text(row.rate.toString())),
                    DataCell(Text(row.state)),
                    DataCell(OrderState.get(context, row.state)),
                    DataCell(
                      GestureDetector(
                        child: const Icon(Icons.keyboard_arrow_right_outlined),
                        onTap: () {},
                      ),
                    ),
                  ]);
                }).toList(),
              );
            },
            error: (err, stack) {
              return Text(err.toString() + stack.toString());
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: Pads.yAxisSm,
        child: Pagination(
          pageCount: 20,
          pageNo: 1,
          // disabled: loading,
          onChange: (current) {
            setState(() {
              // pageNo = current;
              // updateFilters();
              // return ref.refresh(blockchainHisotryProvider(filters));
            });
          },
        ),
      ),
    );
  }
}

class OrderState {
  static late final BuildContext context;
  static final runing = UiButton(
    onPressed: () {
      context.push('/');
    },
    label: "下架",
  );
  static final stopped = UiButton(
    onPressed: () {
      context.push('/');
    },
    label: "上架",
  );

  static UiButton get(BuildContext $context, String state) {
    context = $context;
    if (state == "RUNNING") {
      return runing;
    }
    return stopped;
  }
}
