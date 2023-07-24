import 'package:flutter/material.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/widgets/ui_chip.dart';

class AdPostBankTemplate extends StatelessWidget {
  const AdPostBankTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade50,
      isThreeLine: true,
      title: Material(
        child: Text("默认订单限制 100 CNY ~ 10000 CNY"),
        color: Colors.grey.shade200,
      ),
      subtitle: Column(
        children: [
          Cell(
            title: UiChip(iconWidget: FlutterLogo(), text: "工商银行"),
            trailingText: "6222222222222222222",
          ),
          Cell(
            titleText: "新卡可刷",
            trailingText: "狗鸡",
          ),
        ],
      ),
      trailing: ClipPath(
        // clipper: ,
        child: FlutterLogo(),
      ),
    );
  }
}
