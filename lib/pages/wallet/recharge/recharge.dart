import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/pages/wallet/recharge/recharge.stepper.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_clipboard.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Recharge extends StatefulWidget {
  const Recharge({super.key});

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  final _linker = LayerLink();

  List<Map<String, dynamic>> items = [
    {"name": "最小充币数量", "value": "0.00000001 USDT"},
    {"name": "平均到达时间", "value": "≈ 5 分钟"},
    {"name": "预计到账", "value": "6次网络确认"},
    {"name": "预计解锁", "value": "6次网络确认"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数字货币充值'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          overlayEntry?.remove();
          overlayEntry = null;
        },
        child: ListView(
          children: [
            Container(
              color: Colors.grey.shade100,
              padding: Pads.sm,
              child: const RechargeStepper(
                steps: [
                  RechargeStep(
                    title: "复制充币地址",
                    subtitle: "选择您要充值的币种及其区块网络，并在本页面复制充值地址",
                  ),
                  RechargeStep(
                    title: "发起提币",
                    subtitle: "在对方平台发起提币。",
                  ),
                  RechargeStep(
                    title: "网络确认",
                    subtitle: "等待区块网络确认您的转账。",
                  ),
                  RechargeStep(
                    title: "充币成功",
                    subtitle: "区块确认完成后，XXXX将为您上账。",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Dropdown(
              name: "",
              labelText: "币种选择",
              type: DropdownType.menu,
              data: [
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
              ],
              dropdownBuilder: (context, selectedItem) {
                return UiChip(icon: Icons.abc, text: "USDT");
              },
            ),
            const SizedBox(height: 24),
            Dropdown(
              name: "",
              labelText: "币种选择",
              type: DropdownType.menu,
              data: [
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
                DropdownItem(title: "title"),
              ],
              dropdownBuilder: (context, selectedItem) {
                return UiChip(icon: Icons.abc, text: "USDT");
              },
            ),
            const SizedBox(height: 24),
            ListTile(
              tileColor: Colors.grey.shade100,
              title: const Text(
                "地址：",
                style: Font.mediumBold,
              ),
              subtitle: UiClipboard(
                text: "0x4e2b74082e7d92f268af688fd6b939cc7b57d428",
                child: Text("0x4e2b74082e7d92f268af688fd6b939cc7b57d428"),
                iconSize: 18,
              ),
              trailing: CompositedTransformTarget(
                link: _linker,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    createOverlay();
                  },
                  child: QrImageView(
                    data: "data",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: Pads.sm,
              child: DefaultTextStyle(
                style: Font.smallGrey,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    height: 40,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name']),
                        Text(item['value']),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text.rich(TextSpan(
              text: "▪此地址只可接收 ",
              children: [
                TextSpan(
                  text: "USDT",
                  style: TextStyle(color: Colors.red),
                )
              ],
            )),
            const Text.rich(TextSpan(
              text: "▪请再次确认您选择的主网络是 ",
              children: [
                TextSpan(
                  text: "BNB Smart Chain (BEP20)",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  OverlayEntry? overlayEntry;
  createOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
      return;
    }
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return UnconstrainedBox(
          child: CompositedTransformFollower(
            link: _linker,
            showWhenUnlinked: false,
            targetAnchor: Alignment.centerLeft,
            followerAnchor: Alignment.centerRight,
            child: SizedBox(
              width: 312,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: Pads.sm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("扫二维码"),
                      const Text(
                        "▪此地址只可接收USDT",
                        style: Font.smallGrey,
                      ),
                      const Text(
                        "▪请再次确认您选择的主网络是BNB Smart Chain (BEP20)",
                        style: Font.smallGrey,
                      ),
                      QrImageView(
                        data: "data",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    // Add the OverlayEntry to the Overlay.
    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }
}
