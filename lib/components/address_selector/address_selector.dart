import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/constants/blockchain.dart';
import 'package:otc/models/address/address.model.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class AddressSelector extends Dropdown {
  AddressSelector({
    super.key,
    required super.name,
    super.formState,
    super.type = DropdownType.dialog,
    super.onChanged,
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
          props: PopupProps.dialog(
            emptyBuilder: (context, searchEntry) {
              return const UiEmptyView(
                title: "您还没有添加常用地址",
                subtitle: "将常用地址保存在地址簿，可以在将来提币时直接使用。为每个地址添加标签方便识别。",
              );
            },
            containerBuilder: (context, popupWidget) {
              return Card(
                color: Colors.white,
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    popupWidget,
                    Padding(
                      padding: Pads.topLg,
                      child: UiButton.text(
                        fullWidth: true,
                        onPressed: () {},
                        label: "添加地址",
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          asyncItems: (text) async {
            final result = await apis.wallet.getAddressBook();
            await Future.delayed(Duration(seconds: 10));
            // final addresses = result.map(AddressModel.fromJson).toList();
            print("+++++++++++++++++++++++++++++++");
            return [];
            // return addresses
            //     .map(
            //       (item) => DropdownItem(
            //         title: "${item.currency}提币地址",
            //         subtitle: "提币地址 ${item.title}",
            //         subtitleStyle: Font.miniGrey,
            //         value: item.title,
            //         extra: item.reference,
            //         trailingWidget: Column(
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const Text(
            //               "转账网络",
            //               style: Font.medium,
            //             ),
            //             Text(
            //               item.blockchain.name,
            //               style: Font.miniGrey,
            //             ),
            //           ],
            //         ),
            //       ),
            //     )
            //     .toList();
          },
          // data: BlockChain.values
          //     .map(
          //       (item) => DropdownItem(
          //         title: "${item.protocal.name}提币地址",
          //         subtitle: "提币地址 ${item.title}",
          //         subtitleStyle: Font.miniGrey,
          //         value: item.name,
          //         extra: item.protocal,
          //         trailingWidget: Column(
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             const Text(
          //               "转账网络",
          //               style: Font.medium,
          //             ),
          //             Text(
          //               item.protocal.name,
          //               style: Font.miniGrey,
          //             ),
          //           ],
          //         ),
          //       ),
          //     )
          //     .toList(),
        );
}

// final _addressBookProvider = FutureProvider.autoDispose<List<AddressModel>>((ref) async {
//   final result = await apis.wallet.getAddressBook();
//   return result.map(AddressModel.fromJson).toList();
// });
