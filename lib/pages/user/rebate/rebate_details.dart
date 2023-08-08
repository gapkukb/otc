import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/pages/user/rebate/rebate_details.provider.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class RebateDetails extends ConsumerStatefulWidget {
  const RebateDetails({super.key});

  @override
  ConsumerState<RebateDetails> createState() => _RebateDetailsState();
}

class _RebateDetailsState extends ConsumerState<RebateDetails> {
  int pageNo = 1;
  int pageCount = 1;
  final Map<String, dynamic> filters = {
    "page": 1,
    "pageSize": 8,
  };

  @override
  Widget build(context) {
    return Panel(
      title: "佣金明细",
      child: Consumer(
        builder: (context, ref, child) {
          final future = ref.watch(rebateDetailProvider(filters));
          return future.when(
            data: (data) {
              pageCount = data.pages;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 440,
                    child: DataTable2(
                      dividerThickness: 0.01,
                      headingTextStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      columnSpacing: 4,
                      columns: const [
                        DataColumn2(label: Text("订单编号")),
                        DataColumn2(label: Text("订单金额(USDT)")),
                        DataColumn2(label: Text("订单类型")),
                        DataColumn2(label: Text("佣金金额（USDT）")),
                        DataColumn2(label: Text("完成时间")),
                      ],
                      empty: const UiEmptyView(),
                      rows: data.records
                          .map(
                            (e) => DataRow(
                              cells: [
                                DataCell(Text(e.reference)),
                                DataCell(Text(e.takerCoinAmount.toString())),
                                DataCell(Text(e.sell ? "挂买单" : "挂卖单")),
                                DataCell(Text(e.rewardAmount.toString())),
                                DataCell(Text(e.createdTime)),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Pagination(
                    isDense: true,
                    pageNo: pageNo,
                    pageCount: pageCount,
                    onChange: (current) {
                      setState(() {
                        pageNo = current;
                        filters.update("page", (value) => pageNo);
                        return ref.refresh(rebateDetailProvider(filters));
                      });
                    },
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Text(error.toString() + stackTrace.toString()),
            loading: () {
              return const Center(
                heightFactor: 3,
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
