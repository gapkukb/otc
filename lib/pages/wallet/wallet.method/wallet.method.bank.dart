import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/constants/banks.dart';
import 'package:otc/models/wallet.bank/wallet.bank.model.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletMethodBank extends StatefulWidget {
  const WalletMethodBank({super.key});

  @override
  State<WalletMethodBank> createState() => _WalletMethodBankState();
}

class _WalletMethodBankState extends State<WalletMethodBank> {
  List<WalletBankModel> items = [];

  @override
  void initState() {
    super.initState();
    apis.wallet.getAllBankCards().then((value) {
      setState(() {
        items = value.map((e) => WalletBankModel.fromJson(e)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 8,
      horizontalMargin: 8,
      dividerThickness: 0.01,
      headingTextStyle: const TextStyle(color: Colors.grey),
      columns: const [
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
      rows: items.map((item) {
        return DataRow(
          cells: [
            DataCell(Text(item.name)),
            DataCell(Text(item.cardNumber)),
            DataCell(Text(item.bank)),
            DataCell(Text(item.bankBranch)),
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UiButton(
                    variant: UiButtonVariant.text,
                    size: UiButtonSize.mini,
                    label: "查看",
                    onPressed: () {},
                  ),
                  UiButton(
                    variant: UiButtonVariant.text,
                    size: UiButtonSize.mini,
                    label: "删除",
                    onPressed: () {
                      Modal.confirm(
                        content: "确认要删除改收款地址吗",
                        onOk: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
      empty: const UiEmptyView(
        title: "未找到银行卡收款地址",
        subtitle: "点击右上角\"收款方式\"添加银行卡",
      ),
    );
  }
}
