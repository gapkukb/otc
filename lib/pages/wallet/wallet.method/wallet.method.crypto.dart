import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/models/address/address.model.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletMethodCrypto extends StatefulWidget {
  const WalletMethodCrypto({super.key});

  @override
  State<WalletMethodCrypto> createState() => _WalletMethodCryptoState();
}

class _WalletMethodCryptoState extends State<WalletMethodCrypto> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    // apis.wallet.getAddressBook().then((value) {
    //   setState(() {
    //     items = value;
    //   });
    // });
  }

  edit(BuildContext context, dynamic item) {}
  delete(BuildContext context, dynamic item) {
    Modal.confirm(
      content: "确认要删除改收款地址吗",
      onOk: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Pads.sm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "将常用地址保存在地址簿，可以在将来提币时直接使用。为地址设置备注将更有助于管理您的地址。",
            style: Font.miniGrey,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("钱包地址"),
                onPressed: verify(context, () {
                  context.pushNamed(Routes.walletMethodCryptoAddition);
                }),
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
              rows: items
                  .map(
                    (item) => DataRow(
                      cells: [
                        DataCell(Text(item.remark)),
                        DataCell(
                          UiChip(icon: Icons.abc, text: item.currency.name),
                        ),
                        DataCell(Text(item.reference)),
                        DataCell(Text(item.blockchain.name)),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UiButton(
                                variant: UiButtonVariant.text,
                                size: UiButtonSize.mini,
                                label: "查看",
                                onPressed: verify(context, () {
                                  edit(context, item);
                                }),
                              ),
                              UiButton(
                                variant: UiButtonVariant.text,
                                size: UiButtonSize.mini,
                                label: "删除",
                                onPressed: verify(context, () {
                                  edit(context, item);
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              empty: const UiEmptyView(),
            ),
          ),
        ],
      ),
    );
  }
}
