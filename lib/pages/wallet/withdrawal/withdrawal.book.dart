import 'package:flutter/material.dart';
import 'package:otc/components/address_selector/address_selector.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/gap/gap.dart';

class WithdrawalBook extends StatefulWidget {
  final Map<String, dynamic> formState;
  final String name;
  final Function(String address, String coin) onChange;
  const WithdrawalBook({
    super.key,
    required this.formState,
    required this.name,
    required this.onChange,
  });

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
          name: widget.name,
          formState: widget.formState,
          onChanged: (selectedItem) {
            setState(() {
              address = selectedItem!.extra;
              blockchain = selectedItem.subtitle!;
              widget.onChange(address, blockchain);
            });
          },
        ),
        const Gap.small(),
        Cell(
          height: 32,
          titleText: "提币地址",
          trailing: Text(address),
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
