import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import './filters.dart';
import './provider.dart';

class MerchantInvitation extends ConsumerStatefulWidget {
  const MerchantInvitation({
    super.key,
  });

  @override
  ConsumerState<MerchantInvitation> createState() => _MerchantIncomeState();
}

class _MerchantIncomeState extends ConsumerState<MerchantInvitation> {
  final Map<String, dynamic> formState = {};
  Map<String, dynamic> filters = {};
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    updateFilters();
  }

  updateFilters() {
    filters.addAll({
      ...filters,
      "code": filters["code"] == "" ? null : filters["code"],
      "page": 1,
      "pageSize": 50,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: MerchantInvitationFilters(
          formState: formState,
          onSearch: () {
            research(1);
          },
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(merchantInvitationProvider(filters));
            return provider.when(
              data: (data) {
                return DataTable2(
                  headingTextStyle: Font.miniGrey,
                  columns: const [
                    DataColumn2(label: Text("序号"), fixedWidth: 220),
                    DataColumn2(label: Text("邀请码")),
                    DataColumn2(label: Text("邀请链接")),
                    DataColumn2(label: Text("状态")),
                    DataColumn2(label: Text("银行卡佣金")),
                    DataColumn2(label: Text("支付宝佣金")),
                    DataColumn2(label: Text("微信佣金"), fixedWidth: 160),
                    DataColumn2(label: Text("用户ID")),
                  ],
                  columnSpacing: 4,
                  dataRowHeight: 60,
                  // dividerThickness: 0.001,
                  empty: provider.isLoading ? null : const UiEmptyView(),
                  rows: data.records.map((row) {
                    return DataRow(
                      cells: [
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
                        DataCell(Text("出售")),
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
      ),
    );
  }

  research(int currentPage) {
    formKey.currentState!.save();
    setState(() {
      updateFilters();
      return provider.refresh(merchantInvitationProvider(filters));
    });
  }
}
