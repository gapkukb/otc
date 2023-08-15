import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/constants/base_url.dart';
import 'package:otc/models/wallet.qrcode/wallet.qrcode.model.dart';
import 'package:otc/pages/wallet/wallet.method/bank.provider.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletQRcode extends ConsumerStatefulWidget {
  final AddType addType;
  const WalletQRcode({
    super.key,
    this.addType = AddType.alipay,
  });
  @override
  ConsumerState<WalletQRcode> createState() => _WalletQRcodeState();
}

class _WalletQRcodeState extends ConsumerState<WalletQRcode> {
  String? current;
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(context) {
    final AsyncValue<List<WalletQrcodeModel>> result = ref.watch(qrcodeProvider(widget.addType));

    return result.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Text(err.toString() + stack.toString()),
      data: (items) {
        return DataTable2(
          columnSpacing: 8,
          horizontalMargin: 8,
          dividerThickness: 0.01,
          headingTextStyle: const TextStyle(color: Colors.grey),
          clipBehavior: Clip.none,
          columns: [
            const DataColumn2(label: Text("姓名")),
            const DataColumn2(label: Text("备注")),
            DataColumn2(label: Text("${widget.addType.chinese}账号")),
            const DataColumn2(label: Text("收款二维码")),
            const DataColumn2(
              label: Text(
                "\t操作",
                style: TextStyle(),
              ),
              fixedWidth: 120,
            ),
          ],
          rows: items
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Text(item.name)),
                    DataCell(Text(item.title)),
                    DataCell(Text(item.account)),
                    DataCell(
                      onTap: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              content: SizedBox(
                                width: 400,
                                height: 400,
                                child: Image.network(
                                  fileUrl + item.content,
                                  height: 400,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      Image.network(
                        fileUrl + item.content,
                        height: 36,
                      ),
                    ),
                    DataCell(
                      UiButton(
                        variant: UiButtonVariant.text,
                        size: UiButtonSize.mini,
                        label: "删除",
                        onPressed: () {
                          Modal.confirm(
                            content: "确认要删除该收款地址吗",
                            onOk: () async {
                              await apis.wallet.deleteQRcode({"reference": item.reference});
                              provider.refresh(qrcodeProvider(widget.addType));
                            },
                          );
                        },
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
