import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/pages/merchant/income/provider.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import './filters.dart';

class MerchantIncome extends ConsumerStatefulWidget {
  const MerchantIncome({
    super.key,
  });

  @override
  ConsumerState<MerchantIncome> createState() => _MerchantIncomeState();
}

class _MerchantIncomeState extends ConsumerState<MerchantIncome> {
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
      ...formState,
      "in": formState['in'] == "" ? null : formState['in'],
      "page": pageNo,
      "pageSize": pageSize,
      "begin": formState["minDate"] == null ? null : formState["minDate"] + " 00:00:00",
      "end": formState["maxDate"] == null ? null : formState["maxDate"] + " 23:59:59",
    });

    inspect(filters);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: MerchantIncomeFilters(
          formState: formState,
          onSearch: () {
            research(1);
          },
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(merchantIncomeProvider(filters));
            return provider.when(
              data: (data) {
                pageCount = data.pages;
                return DataTable2(
                  headingTextStyle: Font.miniGrey,
                  columns: const [
                    DataColumn2(label: Text("订单编号"), fixedWidth: 220),
                    DataColumn2(label: Text("类型")),
                    DataColumn2(label: Text("已成交数量")),
                    DataColumn2(label: Text("已成交价格")),
                    DataColumn2(label: Text("汇率")),
                    DataColumn2(label: Text("支付方式")),
                    DataColumn2(label: Text("更新时间"), fixedWidth: 160),
                    DataColumn2(label: Text("佣金比例")),
                    DataColumn2(label: Text("佣金数量")),
                  ],
                  columnSpacing: 4,
                  dataRowHeight: 60,
                  // dividerThickness: 0.001,
                  empty: provider.isLoading ? null : const UiEmptyView(),
                  rows: data.records.map((row) {
                    return DataRow(
                      cells: [
                        DataCell(Text(row.reference)),
                        DataCell(Text(row.sell ? "出售" : "购买")),
                        DataCell(Text(row.takerCoinAmount.toString())),
                        DataCell(Text(row.takerMoneyAmount.toString())),
                        DataCell(Text(row.rate.toString())),
                        DataCell(PaymentMethods.getByValue(row.paymentMethod).icon()),
                        DataCell(Text(row.createdTime)),
                        DataCell(Text(row.rate.toString())),
                        DataCell(Text(row.deservedReward.toString())),
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
      return provider.refresh(merchantIncomeProvider(filters));
    });
  }
}
