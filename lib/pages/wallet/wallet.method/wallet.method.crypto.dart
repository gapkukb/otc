import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/models/address/address.model.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/wallet.address.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/predication.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletMethodCrypto extends ConsumerWidget {
  const WalletMethodCrypto({super.key});

  delete(BuildContext context, AddressModel item) {
    Modal.confirm(
      content: "确认要删除改收款地址吗",
      onOk: () async {
        await apis.wallet.deleteAddress({
          "reference": item.reference,
        });

        Modal.showText(text: "删除地址成功");
        provider.refresh(walletAddressProvider);
      },
    );
  }

  @override
  Widget build(context, ref) {
    final result = ref.watch(walletAddressProvider);

    return result.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, __) => Center(
        child: Text(e.toString()),
      ),
      data: (items) {
        print("object");
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
                    onPressed: () async {
                      final ok = await predication(context: context, types: [
                        Predication.phone,
                        Predication.kyc1,
                      ]);

                      if (ok) {
                        final successful = await context.pushNamed<bool>(Routes.walletMethodCryptoAddition);
                        if (successful == true) {
                          return ref.refresh(walletAddressProvider);
                        }
                      }
                    },
                  )
                ],
              ),
              Expanded(
                child: DataTable2(
                  columnSpacing: 4,
                  horizontalMargin: 8,
                  dividerThickness: 0.01,
                  headingTextStyle: const TextStyle(color: Colors.grey),
                  columns: const [
                    DataColumn2(label: Text("地址备注")),
                    DataColumn2(label: Text("币种")),
                    DataColumn2(label: Text("地址"), fixedWidth: 360),
                    DataColumn2(label: Text("转账网络")),
                    DataColumn2(
                      label: Text(
                        "\t\t\t操作",
                        style: TextStyle(),
                      ),
                      fixedWidth: 60,
                    ),
                  ],
                  rows: items
                      .map(
                        (item) => DataRow(
                          cells: [
                            DataCell(Text(item.remark)),
                            DataCell(
                              UiChip(
                                iconWidget: SizedBox(
                                  width: 20,
                                  child: Cryptocurrency.getByName(item.currency.name)?.icon,
                                ),
                                text: item.currency.name,
                              ),
                            ),
                            DataCell(Text(item.wallet)),
                            DataCell(Text(item.blockchain.name)),
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  UiButton(
                                    variant: UiButtonVariant.text,
                                    size: UiButtonSize.mini,
                                    label: "删除",
                                    onPressed: () {
                                      delete(context, item);
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
