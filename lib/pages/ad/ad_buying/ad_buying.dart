import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/components/mix_text/mix_text.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/pages/ad/ad_buying/ad_buying.filters.dart';
import 'package:otc/pages/ad/ad_buying/ad_buying.provider.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class AdBuying extends StatefulWidget {
  final bool isBuying;
  const AdBuying({
    super.key,
    this.isBuying = true,
  });

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
  Timer? timer;
  int value = 0;

  @override
  void initState() {
    super.initState();
    updateFilters();
  }

  @override
  dispose() {
    super.dispose();
    timer?.cancel();
  }

  updateFilters() {
    filters.addAll({
      "sell": widget.isBuying,
      "coin": Cryptocurrency.USDT.name,
      "money": Fiatcurrency.CNY.name,
      "page": pageNo,
      "pageSize": pageSize,
      "paymentMethod": formState['paymentMethod'] == "all" ? null : formState['paymentMethod'],
    });
  }

  autoRefresh(int seconds) {
    timer = Timer.periodic(Duration(seconds: seconds), (timer) {
      updateFilters();
      provider.refresh(adBuyingProvider(filters));
    });
  }

  @override
  Widget build(context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AdBuyingFilter(
          formState: formState,
          value: value,
          isBuying: widget.isBuying,
          onSearch: () {
            formKey.currentState!.save();
            updateFilters();
            setState(() {
              pageNo = 1;
              provider.refresh(adBuyingProvider(filters));
            });
          },
          onAutoChange: (time) {
            timer?.cancel();
            if (time != 0) {
              autoRefresh(time);
            }
            setState(() {
              value = time;
            });
          },
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(
              adBuyingProvider(filters),
            );

            return provider.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (_, __) => Text(_.toString() + __.toString()),
              data: (data) {
                pageCount = data.pages;
                if (data.records.isEmpty) {
                  return const UiEmptyView(
                    title: "暂无更多广告",
                  );
                }
                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: DataTable2(
                        dataRowHeight: 70,
                        headingTextStyle: Font.miniGrey,
                        columns: const [
                          DataColumn2(label: Text("广告主")),
                          DataColumn2(label: Text("价格")),
                          DataColumn2(label: Text("数量\n限额")),
                          DataColumn2(label: Text("支付方式"), fixedWidth: 160),
                          DataColumn2(label: Text("操作"), fixedWidth: 100),
                        ],
                        columnSpacing: 4,
                        // dividerThickness: 0.001,
                        empty: provider.isLoading
                            ? null
                            : const UiEmptyView(
                                iconSize: 140,
                                title: "未找到交易记录",
                              ),
                        rows: data.records.map<DataRow>((row) {
                          inspect(row.methods);
                          final methods = row.methods.map((method) => PaymentMethods.getByValue(method));

                          return DataRow(cells: [
                            DataCell(ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Avatar(
                                avatar: row.avatar,
                              ),
                              title: Text(row.nickname),
                              subtitle: SizedBox(
                                height: 24,
                                child: Row(
                                  children: [
                                    Text("${row.makerSuccessTimes}成交量"),
                                    const VerticalDivider(
                                      width: 17,
                                      thickness: 1,
                                      indent: 4,
                                      endIndent: 4,
                                    ),
                                    Text("${(row.makerSuccessTimes / max(row.makerTimes, 1) * 100).decimalize()}%成交率"),
                                  ],
                                ),
                              ),
                            )),
                            DataCell(Text("${row.finalRate} CNY")),

                            DataCell(MixText(
                              child: "${(row.amount * row.finalRate).toStringAsFixed(2)} CNY\n",
                              small: "￥${row.minLimit} - ￥${row.maxLimit}",
                            )),
                            DataCell(Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: methods.map((pay) => pay.text).join(","),
                              child: Wrap(
                                spacing: 4,
                                children: methods.map((pay) => pay.icon()).toList(),
                              ),
                            )),

                            // DataCell(Tooltip(
                            //   message: methods.map((e) => e.text).join(","),
                            //   triggerMode: TooltipTriggerMode.tap,
                            //   child: Wrap(
                            //     spacing: 8,
                            //     children: methods.map((e) => e.icon(24)).toList(),
                            //   ),
                            // )),
                            DataCell(UiButton(
                              onPressed: () {
                                Modal.alert(
                                  content: "您所在的ip暂不支持买卖数字货币的功能。",
                                  okButtonText: "已知晓",
                                );
                              },
                              label: widget.isBuying ? "购买USDT" : "出售USDT",
                            )),
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
                );
              },
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: Pads.yAxisSm,
          child: Pagination(
            pageCount: pageCount,
            pageNo: 1,
            // disabled: loading,
            onChange: (current) {
              setState(() {
                pageNo = current;
                updateFilters();
                return provider.refresh(adBuyingProvider(filters));
              });
            },
          ),
        ),
      ),
    );
  }
}
