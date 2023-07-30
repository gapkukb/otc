import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_clipboard.dart';

class WalletDetail extends ConsumerWidget {
  final String id;
  const WalletDetail({
    super.key,
    required this.id,
  });
  @override
  Widget build(context, ref) {
    final resp = ref.watch(_detailProvider);
    return resp.when(
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const CircularProgressIndicator(),
      data: (data) {
        return ModalPageTemplate(
          legend: "钱包",
          title: "充值详情",
          iconData: Icons.credit_card_outlined,
          showOkButton: false,
          cancelButtonText: "关闭",
          onCompelete: (context) {},
          children: [
            _Stepper(),
            _Cell(
              titleText: "状态",
              trailingText: "▪已完成",
              trailingTextStyle: Font.miniGrey.copyWith(color: Colors.green),
            ),
            _Cell(
              titleText: "时间",
              trailingText: "2023-06-09 10:50",
            ),
            _Cell(
              titleText: "币种",
              trailingText: "USDT",
            ),
            _Cell(
              titleText: "充值数量",
              trailingText: "323,443.23",
              trailingTextStyle: Font.largeBold,
            ),
            _Cell(
              titleText: "转账网络",
              trailingText: "ERC20",
            ),
            _Cell(
              titleText: "地址",
              trailing: UiClipboard(
                text: "0x34de6aef66432cbdbc1f6d64abbb1bb7eff764cf",
                iconSize: 16,
                child: Text(
                  "0x34de6aef66432cbdbc1f6d64abbb1bb7eff764cf11111111122",
                  style: Font.miniGrey,
                ),
              ),
            ),
            _Cell(
              titleText: "地址",
              trailingTextStyle: Font.miniGrey,
              trailing: UiClipboard(
                text: "0x34de6aef66432cbdbc1f6d64abbb1bb7eff764cf",
                iconSize: 16,
                child: Text(
                  "0xd071d895707651032426fdd2fbef26eab46408a60dacf4c3000916d1b454fe98",
                  style: Font.miniGrey,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            _Cell(
              titleText: "充币账户",
              trailingText: "资金钱包",
            ),
            Gap.small(),
            Divider(
              height: 1,
            )
          ],
        );
      },
    );
  }
}

class _Cell extends Cell {
  const _Cell({
    super.key,
    super.trailingTextStyle = Font.miniGrey,
    super.height = 40,
    super.trailingText,
    super.trailing,
    super.title,
    super.titleText,
  });
}

class _Stepper extends StatelessWidget {
  const _Stepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Container(
                child: Text("1"),
                alignment: Alignment.center,
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(
                "提币申请已提交",
                style: Font.small,
              ),
              subtitle: Text(
                "2023-06-10 16:38",
                style: Font.miniGrey,
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Container(
                child: Text("1"),
                alignment: Alignment.center,
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(
                "提币申请已提交",
                style: Font.small,
              ),
              subtitle: Text(
                "2023-06-10 16:38",
                style: Font.miniGrey,
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Container(
                child: Text("1"),
                alignment: Alignment.center,
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(
                "提币申请已提交",
                style: Font.small,
              ),
              subtitle: Text(
                "2023-06-10 16:38",
                style: Font.miniGrey,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                child: Text("1"),
                alignment: Alignment.center,
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(
                "提币申请已提交",
                style: Font.small,
              ),
              subtitle: Text(
                "",
                style: Font.miniGrey,
              ),
            ),
          ],
        ),
        Positioned(
          left: 14,
          top: 52,
          child: Material(
            color: Colors.amber,
            child: SizedBox(
              width: 4,
              height: 24,
            ),
          ),
        ),
        Positioned(
          left: 14,
          top: 116,
          child: Material(
            color: Colors.amber,
            child: SizedBox(
              width: 4,
              height: 24,
            ),
          ),
        ),
        Positioned(
          left: 14,
          top: 182,
          child: Material(
            color: Colors.amber,
            child: SizedBox(
              width: 4,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}

final _detailProvider = FutureProvider<dynamic>((ref) async {
  return apis.wallet.deleteAddress;
});
