library ad_own;

import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/models/ad.my/ad.my.model.dart';
import 'package:otc/models/ad.my/ad.my.taker.model.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'package:otc/pages/ad/ad_own/ad_own.filters.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'dart:math' as math;

part 'ad_own.provider.dart';
part 'ad_own.detail.dart';

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
    filters.addAll({
      "sell": formState["sell"] == "all" ? null : formState["sell"],
      "state": formState["state"] == "all" ? null : formState["state"],
      "currency": formState["currency"] ?? Cryptocurrency.USDT.name,
      "page": pageNo,
      "pageSize": pageSize,
      "begin": formState["minDate"] == null ? null : formState["minDate"] + " 00:00:00",
      "end": formState["maxDate"] == null ? null : formState["maxDate"] + " 23:59:59",
      "makerOrderState": "RUNNING"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AdOwnFilters(
          formState: formState,
          onSearch: () {
            research(1);
          },
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(adOwnProvider(filters));
            return provider.when(
              data: (data) {
                pageCount = data.pages;
                return DataTable2(
                  columns: const [
                    DataColumn2(label: Text("广告编号\n币种/法币"), fixedWidth: 220),
                    DataColumn2(label: Text("类型")),
                    DataColumn2(label: Text("广告数量\n限额"), fixedWidth: 200),
                    DataColumn2(label: Text("已成交数量")),
                    DataColumn2(label: Text("已成交价格")),
                    DataColumn2(label: Text("状态")),
                    DataColumn2(label: Text("创建时间"), fixedWidth: 160),
                    DataColumn2(label: Text("操作")),
                    DataColumn2(label: Text(""), fixedWidth: 60),
                  ],
                  columnSpacing: 4,
                  dataRowHeight: 60,
                  // dividerThickness: 0.001,
                  empty: provider.isLoading ? null : const UiEmptyView(),
                  rows: data.records.map((row) {
                    final min = row.channels.map((e) => e.amountMin).reduce(math.min);
                    final max = row.channels.map((e) => e.amountMax).reduce(math.max);

                    return DataRow(
                      cells: [
                        DataCell(Text("${row.reference}\n${row.coin.name}/${row.money.text}")),
                        DataCell(Text(row.sell ? "出售" : "购买")),
                        DataCell(Text("${row.submitAmount} USDT\n￥$min - ￥$max")),
                        DataCell(Text(row.totalCoinAmount.toString())),
                        DataCell(Text(row.totalMoneyAmount.toString())),
                        DataCell(Text(getStateText(row.state))),
                        DataCell(Text(row.createdTime)),
                        DataCell(stateButton(
                          context,
                          row.state,
                          row.reference,
                          () {
                            return ref.refresh(adOwnProvider(filters));
                          },
                        )),
                        DataCell(
                          const Icon(Icons.keyboard_arrow_right_outlined),
                          onTap: () => showDetail(context, row.takerDeals),
                        ),
                      ],
                    );
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
            pageCount: pageCount,
            pageNo: pageNo,
            // disabled: loading,
            onChange: research,
          ),
        ),
      ),
    );
  }

  research(int currentPage) {
    formKey.currentState!.save();
    setState(() {
      pageNo = currentPage;
      updateFilters();
      return provider.refresh(adOwnProvider(filters));
    });
  }

  showDetail(BuildContext context, List<AdMyTakerModel> detail) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AdOwnDetail(detail: detail);
      },
    );
  }
}

stateButton(BuildContext context, String state, String reference, Function onStopped) {
  final runing = UiButton(
    onPressed: () {
      Modal.confirm(
        title: "确认下架广告",
        content: "下架后您的广告将不再被用户看见，\n正在进行中的订单无法被下架。",
        onOk: () async {
          await apis.otc.stopAd({
            "reference": reference,
          });

          onStopped();
        },
      );
    },
    label: "下架",
  );

  if (state == "RUNNING") {
    return runing;
  }
  return const SizedBox.shrink();
}

String getStateText(String state) {
  switch (state) {
    case "RUNNING":
      return "已上架";
    default:
      return "已下架";
  }
}
