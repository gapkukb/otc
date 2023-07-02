import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletAddressBank extends StatefulWidget {
  const WalletAddressBank({super.key});

  @override
  State<WalletAddressBank> createState() => _WalletAddressBankState();
}

class _WalletAddressBankState extends State<WalletAddressBank> {
  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 8,
      horizontalMargin: 8,
      dividerThickness: 0.01,
      headingTextStyle: const TextStyle(color: Colors.grey),
      columns: const [
        DataColumn2(label: Text("选择"), fixedWidth: 48),
        DataColumn2(label: Text("姓名")),
        DataColumn2(label: Text("银行卡号")),
        DataColumn2(label: Text("银行名称")),
        DataColumn2(label: Text("开户支行")),
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
            DataCell(Text("是狗鸡啊")),
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
    );
  }
}
