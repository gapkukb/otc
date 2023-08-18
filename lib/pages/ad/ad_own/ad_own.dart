library ad_own;

import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/mix_text/mix_text.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/models/ad.my/ad.my.channel.model.dart';
import 'package:otc/models/ad.my/ad.my.model.dart';
import 'package:otc/models/ad.my/ad.my.taker.model.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'package:otc/pages/ad/ad_own/ad_own.filters.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'dart:math' as math;

import 'package:qr_flutter/qr_flutter.dart';

part 'ad_own.provider.dart';
part 'ad_own.detail.dart';

class AdOwn extends StatefulWidget {
  final bool running;
  const AdOwn({
    super.key,
    this.running = true,
  });

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
  StreamSubscription<dynamic>? timer;
  List<AdMyModel> rows = const [];

  @override
  void initState() {
    super.initState();
    refetch();
  }

  refetch() async {
    updateFilters();
    try {
      final data = await apis.otc.myAdvertise(filters);
      setState(() {
        pageCount = data.pages;
        rows = data.records;
      });
    } finally {
      if (widget.running) {
        timer = Future.delayed(const Duration(seconds: 5)).asStream().listen((_) {
          refetch();
        });
      }
    }
  }

  @override
  dispose() {
    super.dispose();
    timer?.cancel();
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
      "stopped": widget.running ? false : true,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AdOwnFilters(
          formState: formState,
          running: widget.running,
          onSearch: () {
            research(1);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: DataTable2(
            headingTextStyle: Font.miniGrey,
            columns: [
              const DataColumn2(label: Text("广告编号\n币种/法币"), fixedWidth: 220),
              const DataColumn2(label: Text("类型")),
              const DataColumn2(label: Text("广告数量\n限额"), fixedWidth: 200),
              const DataColumn2(label: Text("已成交数量")),
              const DataColumn2(label: Text("剩余数量")),
              const DataColumn2(label: Text("已成交价格")),
              const DataColumn2(label: Text("支付方式")),
              const DataColumn2(label: Text("状态")),
              const DataColumn2(label: Text("创建时间"), fixedWidth: 160),
              if (widget.running)
                const DataColumn2(
                  label: Text("操作"),
                  fixedWidth: 120,
                ),
              const DataColumn2(label: Text(""), fixedWidth: 40),
            ],
            columnSpacing: 4,
            dataRowHeight: 60,
            // dividerThickness: 0.001,
            empty: const UiEmptyView(),
            rows: rows.map((row) {
              final min = row.channels.map((e) => e.amountMin).reduce(math.min);
              final max = row.channels.map((e) => e.amountMax).reduce(math.max);
              final badge = row.takerDeals.where((element) => element.state == AdOwnState.NOTIFIED.name).length;
              final pays = row.methods.map((element) => PaymentMethods.getByValue(element));

              return DataRow(
                cells: [
                  DataCell(Text("${row.reference}\n${row.coin.name}/${row.money.text}")),
                  DataCell(Text(row.sell ? "出售" : "购买")),
                  DataCell(MixText(
                    child: "${row.submitAmount} USDT\n",
                    small: "￥$min - ￥$max",
                  )),
                  DataCell(Text(row.totalCoinAmount.toString())),
                  DataCell(Text("${row.amount} USDT")),
                  DataCell(Text(row.totalMoneyAmount.toString())),
                  DataCell(Tooltip(
                    triggerMode: TooltipTriggerMode.tap,
                    message: pays.map((pay) => pay.text).join(","),
                    child: Wrap(
                      spacing: 4,
                      children: pays.map((pay) {
                        return pay.icon();
                      }).toList(),
                    ),
                  )),
                  DataCell(Text(getStateText(row.state))),
                  DataCell(Text(row.createdTime)),
                  if (widget.running)
                    DataCell(stateButton(
                      context,
                      row.state,
                      row.reference,
                      () {
                        refetch();
                      },
                    )),
                  DataCell(
                    Align(
                      alignment: const Alignment(1, 0),
                      child: Badge(
                        isLabelVisible: badge > 0,
                        label: Text(badge.toString()),
                        alignment: Alignment.centerLeft,
                        offset: const Offset(-14, 0.5),
                        child: const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ),
                    onTap: () => showDetail(context, row),
                  ),
                ],
              );
            }).toList(),
          ),
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
      refetch();
    });
  }

  showDetail(BuildContext context, AdMyModel item) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AdOwnDetail(
          detail: item.takerDeals,
          channels: item.channels,
          running: widget.running,
          onRefresh: () {
            research(pageNo);
          },
        );
      },
    );
  }
}

stateButton(BuildContext context, String state, String reference, Function onStateChange) {
  final stop = UiButton(
    size: UiButtonSize.mini,
    minWidth: 48,
    onPressed: () {
      Modal.confirm(
        title: "确认下架广告",
        content: "下架后退还您被冻结的USDT，\n正在进行中的订单无法被下架。",
        onOk: () async {
          await apis.otc.stopAd({
            "reference": reference,
          });
          onStateChange();
        },
      );
    },
    label: "下架",
  );
  final pause = UiButton(
    size: UiButtonSize.mini,
    minWidth: 48,
    onPressed: () {
      Modal.confirm(
        title: "确认暂停广告",
        content: "暂停广告，在此期间您不会接收到新的订单",
        onOk: () async {
          await apis.otc.pauseAd({
            "reference": reference,
          });
          onStateChange();
        },
      );
    },
    label: "暂停",
  );

  final resume = UiButton(
    size: UiButtonSize.mini,
    minWidth: 48,
    onPressed: () {
      Modal.confirm(
        title: "确认开启广告",
        content: "开启广告，您可以接收新的订单",
        onOk: () async {
          await apis.otc.restartAd({
            "reference": reference,
          });
          onStateChange();
        },
      );
    },
    label: "开启",
  );
  return Wrap(
    spacing: 4,
    children: state == "RUNNING" ? [stop, pause] : [stop, resume],
  );
}

String getStateText(String state) {
  switch (state) {
    case "RUNNING":
      return "已上架";
    case "PAUSE":
      return "已暂停";
    default:
      return "已下架";
  }
}
