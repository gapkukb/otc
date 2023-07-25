import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/models/wallet.qrcode/wallet.qrcode.model.dart';
import 'package:otc/pages/wallet/wallet.method/bank.provider.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
      error: (err, stack) => Text('Error: $err'),
      data: (items) {
        return DataTable2(
          columnSpacing: 8,
          horizontalMargin: 8,
          dividerThickness: 0.01,
          headingTextStyle: const TextStyle(color: Colors.grey),
          clipBehavior: Clip.none,
          columns: [
            const DataColumn2(label: Text("姓名")),
            DataColumn2(label: Text("${widget.addType.chinese}账号")),
            const DataColumn2(label: Text("收款二维码")),
            const DataColumn2(
              label: Text(
                "\t\t\t操作",
                style: TextStyle(),
              ),
              fixedWidth: 120,
            ),
          ],
          rows: items
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(
                      Text(item.name),
                    ),
                    DataCell(
                      Text(item.account),
                    ),
                    DataCell(
                      onTap: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              content: SizedBox(
                                width: 300,
                                height: 300,
                                child: QrImageView(
                                  data: "widget.qrcode",
                                  // size: 300,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      QrImageView(
                        data: "widget.qrcode",
                        size: 100,
                      ),
                      // Image.network(baseUrl + '/' + item.content),
                    ),
                    DataCell(
                      UiButton(
                        variant: UiButtonVariant.text,
                        size: UiButtonSize.mini,
                        label: "删除",
                        onPressed: () {
                          Modal.confirm(
                            content: "确认要删除改收款地址吗",
                            onOk: () async {
                              await apis.wallet.deleteQRcode({"reference": item.reference});
                              provider.refresh(bankProvider);
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

  createOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            _overlayEntry!.remove();
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Positioned(
              left: 0,
              child: SizedBox(
                width: 300,
                height: 300,
                child: QrImageView(
                  data: "widget.qrcode",
                  size: 100,
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }
}

class _Qrcode extends StatefulWidget {
  final String qrcode;
  const _Qrcode({
    super.key,
    required this.qrcode,
  });

  @override
  State<_Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<_Qrcode> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QrImageView(
          data: widget.qrcode,
          size: 100,
        ),
        Positioned(
          width: 300,
          height: 300,
          child: QrImageView(
            data: widget.qrcode,
            size: 300,
          ),
        )
      ],
    );
  }
}
