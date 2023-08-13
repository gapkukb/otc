import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/models/address/address.model.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class AddressSelector extends StatefulWidget {
  final String name;
  final Map<String, dynamic>? formState;
  final void Function(DropdownItem?)? onChanged;
  const AddressSelector({
    super.key,
    required this.name,
    this.formState,
    this.onChanged,
  });

  @override
  State<AddressSelector> createState() => _AddressSelectorState();
}

class _AddressSelectorState extends State<AddressSelector> {
  final promise = apis.wallet.getAddressBook();

  @override
  Widget build(BuildContext context) {
    return Dropdown(
      name: widget.name,
      formState: widget.formState,
      onChanged: widget.onChanged,
      validator: (value) {
        return value == null ? "请选择提币地址" : null;
      },
      labelText: "选择提币地址",
      mode: Mode.DIALOG,
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
      ),
      dialogProps: DialogProps(
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          UiButton.text(
            fullWidth: true,
            size: UiButtonSize.large,
            iconData: Icons.add,
            label: "添加地址",
            onPressed: () {
              context
                ..pop()
                ..pop()
                ..push(Routes.walletMethod, extra: 1);
            },
          ),
        ],
      ),
      asyncItems: (text) async {
        final result = (await promise as List).cast<Map<String, dynamic>>();
        final addresses = result.map(AddressModel.fromJson).map((item) {
          return DropdownItem(
            title: item.remark,
            subtitle: item.blockchain.name,
            subtitleStyle: Font.miniGrey,
            value: item.reference,
            extra: item.wallet,
            trailingWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "转账网络",
                  style: Font.medium,
                ),
                Text(
                  item.blockchain.name,
                  style: Font.miniGrey,
                ),
              ],
            ),
          );
        }).toList();

        return addresses;
      },
    );
  }
}
