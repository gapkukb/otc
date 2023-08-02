import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/constants/blockchain.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';

class BlockchainSelector extends Dropdown {
  BlockchainSelector({
    super.key,
    required super.name,
    super.formState,
    super.mode = Mode.DIALOG,
    super.onChanged,
    super.validator,
  }) : super(
          labelText: "选择转账网络",
          title: const ListTile(
            isThreeLine: true,
            title: Text(
              "选择网络",
              style: Font.largeBold,
            ),
            subtitle: Text(
              "确保您选择的充币网络与您在提币平台使用的网络一致，否则资产可能会丢失。",
              style: Font.miniBold,
            ),
          ),
          itemBuilder: (context, item, widget) => Padding(
            padding: Pads.xs,
            child: widget,
          ),
          data: Blockchain.values
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
