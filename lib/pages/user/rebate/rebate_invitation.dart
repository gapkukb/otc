import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/pages/user/rebate/rebate_invitation.helper.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class RebateInvitation extends ConsumerWidget {
  const RebateInvitation({super.key});

  @override
  Widget build(context, ref) {
    return Panel(
      title: "邀请明细",
      child: Consumer(
        builder: (context, ref, child) {
          final future = ref.watch(rebateInvitationProvider);

          return future.when(
            data: (data) {
              return SizedBox(
                width: double.infinity,
                height: 440,
                child: DataTable2(
                  dividerThickness: 0.01,
                  headingTextStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  columns: const [
                    DataColumn2(label: Text("好友的用户ID")),
                    DataColumn2(label: Text("好友昵称")),
                    DataColumn2(label: Text("好友的订单交易额度")),
                    DataColumn2(label: Text("首次交易时间")),
                    DataColumn2(label: Text("最近一次交易时间")),
                  ],
                  empty: const UiEmptyView(),
                  rows: data
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(Text(e.username)),
                            DataCell(Text(e.nickname)),
                            DataCell(Text(e.makerSuccessTotal.toString())),
                            DataCell(Text(e.firstTime)),
                            DataCell(Text(e.lastTime)),
                          ],
                        ),
                      )
                      .toList(),
                ),
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
