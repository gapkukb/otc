import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class UserInvitationFilters extends PreferredSize {
  final Map<String, dynamic> formState;
  final Function() onSearch;

  UserInvitationFilters({
    super.key,
    required this.formState,
    required this.onSearch,
  }) : super(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            clipBehavior: Clip.none,
            title: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Wrap(
                spacing: 16,
                children: [
                  SizedBox(
                    width: 150,
                    height: 56,
                    child: UiTextFormField(
                      labelText: "邀请码",
                      name: "code",
                      formState: formState,
                    ),
                  ),
                  //交易类型
                  SizedBox(
                    width: 150,
                    height: 56,
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
                ],
              ),
            ),
          ),
        );
}
