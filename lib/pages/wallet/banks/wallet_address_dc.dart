import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletAddressMng extends StatefulWidget {
  const WalletAddressMng({super.key});

  @override
  State<WalletAddressMng> createState() => _WalletAddressMngState();
}

class _WalletAddressMngState extends State<WalletAddressMng> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "将常用地址保存在地址簿，可以在将来提币时直接使用。为地址设置备注将更有助于管理您的地址。",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              TextButton.icon(
                icon: Icon(Icons.add),
                label: Text("钱包地址"),
                onPressed: () {
                  context.push('/wallet_addition_dc');
                },
              )
            ],
          ),
          Expanded(
            child: DataTable2(
              columnSpacing: 8,
              horizontalMargin: 8,
              dividerThickness: 0.01,
              headingTextStyle: const TextStyle(color: Colors.grey),
              columns: const [
                DataColumn2(label: Text("选择"), fixedWidth: 48),
                DataColumn2(label: Text("地址备注")),
                DataColumn2(label: Text("币种")),
                DataColumn2(label: Text("地址")),
                DataColumn2(label: Text("转账网络")),
                DataColumn2(
                    label: Text(
                      "\t\t\t操作",
                      style: TextStyle(),
                    ),
                    fixedWidth: 120),
              ],
              rows: List.generate(
                100,
                (index) => DataRow(
                  cells: [
                    DataCell(SizedBox(
                      width: 24,
                      child: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    )),
                    DataCell(Text("是狗鸡啊")),
                    DataCell(UiChip(icon: Icons.abc, text: "USDT")),
                    DataCell(Text("是狗鸡啊")),
                    DataCell(Text("是狗鸡啊")),
                    DataCell(
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text("查看"),
                          ),
                          TextButton(
                            onPressed: () {
                              Modal.confirm(
                                content: "确认要删除改收款地址吗",
                                onOk: () {},
                              );
                            },
                            child: const Text("删除"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).toList(),
              empty: const UiEmptyView(),
            ),
          ),
        ],
      ),
    );
  }
}
