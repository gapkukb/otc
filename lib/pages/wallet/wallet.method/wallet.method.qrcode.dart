import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/models/wallet.qrcode/wallet.qrcode.model.dart';
import 'package:otc/pages/wallet/wallet.method/bank.provider.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletQRcode extends ConsumerWidget {
  final AddType addType;
  const WalletQRcode({
    super.key,
    this.addType = AddType.alipay,
  });

  @override
  Widget build(context, ref) {
    final AsyncValue<List<WalletQrcodeModel>> result = ref.watch(qrcodeProvider(addType));

    return result.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Text('Error: $err'),
      data: (items) {
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
          rows: items
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Text(item.name)),
                    DataCell(QrImageView(
                      data: item.account,
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
              )
              .toList(),
          empty: const UiEmptyView(),
        );
      },
    );
  }
}
