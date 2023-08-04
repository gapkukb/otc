import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/pages/ad/ad_buying/ad_buying.filters.dart';
import 'package:otc/pages/ad/ad_buying/ad_buying.provider.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class AdBuying extends StatefulWidget {
  const AdBuying({super.key});

  @override
  State<AdBuying> createState() => _AdBuyingState();
}

class _AdBuyingState extends State<AdBuying> {
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
      "sell": formState["sell"] ?? true,
      "currency": formState["currency"] ?? Cryptocurrency.USDT.name,
      "state": formState["state"] ?? "UNKNOWN",
      "page": pageNo,
      "pageSize": pageSize,
      "begin": "$begin 00:00:00",
      "end": "${dateFormatter.format(DateTime.now())} 23:59:59",
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AdBuyingHeader(
        formState: formState,
      ),
    );

    //   final provider = ref.watch(
    //     adBuyingProvider(filters),
    //   );

    //   return provider.when(
    //     loading: () => const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //     error: (_, __) => Text(_.toString() + __.toString()),
    //     data: (data) {
    //       pageCount = data.pages;
    //       return Stack(
    //         children: [
    //           SizedBox(
    //             width: double.infinity,
    //             child: DataTable2(
    //               columns: const [
    //                 DataColumn2(label: Text("广告编号\n币种/法币"), fixedWidth: 160),
    //                 DataColumn2(label: Text("类型")),
    //                 DataColumn2(label: Text("广告数量\n限额")),
    //                 DataColumn2(label: Text("汇率")),
    //                 DataColumn2(label: Text("支付方式")),
    //                 DataColumn2(label: Text("状态")),
    //                 DataColumn2(label: Text("更新时间\n创建时间")),
    //                 DataColumn2(label: Text("操作")),
    //               ],
    //               columnSpacing: 4,
    //               dividerThickness: 0.001,
    //               empty: provider.isLoading
    //                   ? null
    //                   : const UiEmptyView(
    //                       iconSize: 140,
    //                       title: "未找到交易记录",
    //                     ),
    //               rows: data.records.map((row) {
    //                 return DataRow(cells: [
    //                   DataCell(Text(row.createdTime)),
    //                   DataCell(Text(row.deposit ? "充值" : "提币")),
    //                   DataCell(Text(row.currency)),
    //                   DataCell(Text(row.amount.decimalize())),
    //                   DataCell(Text(row.amount.decimalize())),
    //                   DataCell(Text(row.amount.decimalize())),
    //                   DataCell(Text(row.amount.decimalize())),
    //                   DataCell(Text(row.amount.decimalize())),
    //                 ]);
    //               }).toList(),
    //             ),
    //           ),
    //           if (provider.isLoading)
    //             const Positioned(
    //               child: Material(
    //                 color: Colors.white30,
    //                 child: Center(
    //                   child: CircularProgressIndicator(),
    //                 ),
    //               ),
    //             )
    //         ],
    //       );
    //     },
    //   );
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}
