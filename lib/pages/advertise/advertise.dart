import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:go_router/go_router.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Advertise extends StatefulWidget {
  const Advertise({super.key});

  @override
  State<Advertise> createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                  popupProps: PopupProps.menu(),
                ),
              ),
              Spacer(),
              TextButton(
                child: Text("历史广告"),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                child: Text("发布新广告"),
                onPressed: () {
                  context.push('/advertise_place');
                },
              ),
            ],
          ),
          _buildTable(),
        ],
      ),
    );
  }

  _buildTable() {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
          columns: [
            DataColumn(label: Text("广告编号\n币种/法币")),
            DataColumn(label: Text("类型")),
            DataColumn(label: Text("广告数量\n限额")),
            DataColumn(label: Text("已成交数量\n（USDT）")),
            DataColumn(label: Text("已成交价格\n（USDT）")),
            DataColumn(label: Text("汇率")),
            DataColumn(label: Text("支付方式")),
            DataColumn(label: Text("状态")),
            DataColumn(label: Text("更新时间\n创建时间")),
            DataColumn(label: Text("操作")),
          ],
          rows: List.generate(100, (index) {
            return DataRow(cells: [
              DataCell(Text("31231232221\nUSDT/CNY")),
              DataCell(Text("出售")),
              DataCell(Text("10,000.00USDT\￥9,000.00-￥9,008.55")),
              DataCell(Text("10,000.00")),
              DataCell(Text("10,000.00")),
              DataCell(Text("6.99")),
              DataCell(Text("银行借记卡")),
              DataCell(Text("已上架")),
              DataCell(Text("2022-05-12 14:30:28\n2022-05-12 14:30:28")),
              DataCell(
                _ActionButton(
                  status: 0,
                  onPressed: () {},
                ),
              ),
            ]);
          }).toList()),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final int status;
  final void Function()? onPressed;

  const _ActionButton({
    required this.status,
    this.onPressed,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  @override
  Widget build(BuildContext context) {
    String text;
    if (widget.status == 0) {
      text = "下架";
    } else if (widget.status == 0) {
      text = "确认收款";
    } else {
      text = "确认未收款\n";
    }

    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          _countDown(),
        ],
      ),
    );
  }
}

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 5;

class _countDown extends StatelessWidget {
  const _countDown();

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: endTime,
      endWidget: const SizedBox.shrink(),
    );
  }
}
