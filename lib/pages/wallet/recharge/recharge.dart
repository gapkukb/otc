import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数字货币充值'),
      ),
      body: ListView(
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
                onTap: () {
                  createOverlay();
                },
                child: QrImageView(
                  data: "data",
                ),
              ),
            ),
          )
        ],
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
        return CompositedTransformFollower(
          link: _linker,
          targetAnchor: Alignment.bottomCenter,
          // followerAnchor: Alignment.centerLeft,

          child: Align(
            alignment: Alignment(0.5, 0.5),
            child: SizedBox(
              height: 100,
              child: Text("data"),
            ),
          ),
        );
      },
    );

    // Add the OverlayEntry to the Overlay.
    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }
}
