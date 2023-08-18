import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/row_gap/row_gap.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class MerchantInvitationFilters extends PreferredSize {
  final Map<String, dynamic> formState;
  final Function() onSearch;

  MerchantInvitationFilters({
    super.key,
    required this.formState,
    required this.onSearch,
  }) : super(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            clipBehavior: Clip.none,
            title: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RowGap(
                items: [
                  SizedBox(
                    width: 150,
                    child: UiTextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      labelText: "邀请码",
                      name: "code",
                      formState: formState,
                    ),
                  ),
                  //交易类型
                  SizedBox(
                    width: 150,
                    child: Dropdown(
                      labelText: "类型",
                      name: "used",
                      formState: formState,
                      initialValue: "",
                      data: [
                        DropdownItem(title: "全部", value: ""),
                        DropdownItem(title: "已使用", value: true),
                        DropdownItem(title: "未使用", value: false),
                      ],
                    ),
                  ),

                  UiButton.text(
                    onPressed: onSearch,
                    label: "搜索",
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        );
}
