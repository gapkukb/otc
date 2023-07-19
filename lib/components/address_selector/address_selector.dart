import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/constants/blockchain.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';

class AddressSelector extends Dropdown {
  AddressSelector({
    super.key,
    required super.name,
    super.formState,
    super.type = DropdownType.dialog,
  }) : super(
          labelText: "选择提币地址",
          title: const ListTile(
            title: Text(
              "从地址簿中选择",
              style: Font.largeBold,
            ),
          ),
          itemBuilder: (context, item, widget) => Padding(
            padding: Pads.xs,
            child: widget,
          ),
          data: BlockChain.values
              .map(
                (item) => DropdownItem(
                  title: item.title,
                  subtitle: item.subTitle,
                  subtitleStyle: Font.miniGrey,
                  value: item.name,
                  extra: item.protocal,
                  trailingWidget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "≈ ${item.duration} 分钟",
                        style: Font.medium,
                      ),
                      const Text(
                        "平均到达时间",
                        style: Font.miniGrey,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        );
}
