import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.addition.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletAddressWechatAndAlipay extends StatefulWidget {
  final AddType addType;
  const WalletAddressWechatAndAlipay({
    super.key,
    required this.addType,
  });

  @override
  State<WalletAddressWechatAndAlipay> createState() =>
      _WalletAddressWechatAndAlipayState();
}

class _WalletAddressWechatAndAlipayState
    extends State<WalletAddressWechatAndAlipay> {
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
        DataColumn2(label: Text("收款二维码")),
        DataColumn2(
            label: Text(
              "\t\t\t操作",
              style: TextStyle(),
            ),
            fixedWidth: 120),
      ],
      rows: List.generate(
        10,
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
            DataCell(QrImageView(
              data: "data",
              size: 100,
            )),
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
                        content: "确认要删除该收款地址吗",
                        onOk: () {},
                      );
                    },
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
