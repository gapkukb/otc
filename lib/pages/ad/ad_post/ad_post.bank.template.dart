import 'package:flutter/material.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_chip.dart';

class AdPostBankTemplate extends StatelessWidget {
  const AdPostBankTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.grey.shade50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.grey.shade200,
              child: DefaultTextStyle(
                style: Font.miniGrey,
                child: Cell(
                  padding: Pads.xAxisXs,
                  titleText: "默认订单限制 100 CNY ~ 10000 CNY",
                  height: 32,
                  trailing: ClipPath(
                    // clipper: ,
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ),
            Cell(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              title: UiChip(
                iconWidget: FlutterLogo(),
                text: "工商银行",
                textStyle: Font.mediumBold,
              ),
              height: 32,
              trailingText: "6222 2222 2222 0092",
              trailingTextStyle: Font.mediumBold,
            ),
            Cell(
              padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
              titleText: "新卡可刷",
              height: 32,
              trailingText: "狗鸡",
            ),
          ],
        ));
  }
}
