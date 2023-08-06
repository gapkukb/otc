import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/date_picker/date_picker.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/constants/currency.dart';

class AdOwnFilters extends PreferredSize {
  final Map<String, dynamic> formState;
  final Function() onSearch;

  AdOwnFilters({
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
                    child: CurrencySelector(
                      name: "currency",
                      formState: formState,
                      initialValue: Cryptocurrency.USDT.name,
                    ),
                  ),
                  //交易类型
                  SizedBox(
                    width: 150,
                    height: 56,
                    child: Dropdown(
                      labelText: "类型",
                      name: "sell",
                      formState: formState,
                      initialValue: "all",
                      data: [
                        DropdownItem(title: "全部", value: "all"),
                        DropdownItem(title: "购买", value: false),
                        DropdownItem(title: "出售", value: true),
                      ],
                    ),
                  ),
                  // 交易方式
                  SizedBox(
                    width: 150,
                    height: 56,
                    child: Dropdown(
                        labelText: "状态",
                        name: "state",
                        initialValue: "all",
                        formState: formState,
                        data: AdOwnState.values
                            .map(
                              (e) => DropdownItem(title: e.text, value: e.name),
                            )
                            .toList()
                          ..insert(
                            0,
                            DropdownItem(title: "全部", value: "all"),
                          )),
                  ),
                  DatePicker(
                    labelText: "开始日期",
                    formState: formState,
                    name: "minDate",
                    maxDate: DateTime.now(),
                    minDate: DateTime(1970),
                  ),
                  DatePicker(
                    labelText: "结束日期",
                    formState: formState,
                    name: "maxDate",
                    maxDate: DateTime.now(),
                    minDate: DateTime(1970),
                  ),

                  TextButton.icon(
                    onPressed: onSearch,
                    icon: const Text("搜索"),
                    label: const Icon(Icons.search_outlined),
                  )
                ],
              ),
            ),
          ),
        );
}

enum AdOwnState {
  PENDING("待付款"),
  NOTIFIED("已通知付款"),
  PAID("已完成付款"),
  BLOCKING("挂起中"),
  CANCELED("已取消");

  const AdOwnState(this.text);

  final String text;

  static AdOwnState getByValue(String value) {
    return AdOwnState.values.firstWhere((element) => element.name == value);
  }
}
