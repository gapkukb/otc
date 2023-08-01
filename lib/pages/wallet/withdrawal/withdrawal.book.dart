import 'package:flutter/material.dart';
import 'package:otc/components/address_selector/address_selector.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/gap/gap.dart';

class WithdrawalBook extends StatefulWidget {
  const WithdrawalBook({super.key});

  @override
  State<WithdrawalBook> createState() => _WithdrawalBookState();
}

class _WithdrawalBookState extends State<WithdrawalBook> {
  String address = "";
  String blockchain = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddressSelector(
          name: "address",
          onChanged: (selectedItem) {
            setState(() {
              address = selectedItem!.title;
            });
          },
        ),
        const Gap.small(),
        Cell(
          height: 32,
          titleText: "提币地址",
          trailingText: address,
        ),
        Cell(
          height: 32,
          titleText: "转账网络",
          trailingText: blockchain,
        ),
      ],
    );
  }
}
