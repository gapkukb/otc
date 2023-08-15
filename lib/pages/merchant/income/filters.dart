import 'package:flutter/material.dart';
import 'package:otc/components/date_picker/date_picker.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class MerchantIncomeFilters extends PreferredSize {
  final Map<String, dynamic> formState;
  final Function() onSearch;

  MerchantIncomeFilters({
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
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      labelText: "订单编号",
                      name: "reference",
                      formState: formState,
                    ),
                  ),
                  //交易类型
                  SizedBox(
                    width: 150,
                    height: 56,
                    child: Dropdown(
                      labelText: "类型",
                      name: "in",
                      formState: formState,
                      initialValue: "",
                      data: [
                        DropdownItem(title: "全部", value: ""),
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
                      labelText: "支付方式",
                      name: "method",
                      formState: formState,
                      data: PaymentMethods.values
                          .map(
                            (e) => DropdownItem(
                              title: e.text,
                              value: e.value,
                            ),
                          )
                          .toList(),
                    ),
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

                  FilledButton.icon(
                    onPressed: onSearch,
                    icon: const Text("搜索"),
                    label: const Icon(Icons.search_outlined),
                  ),
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

  static Widget getWidgetByValue(String value) {
    try {
      final matched = AdOwnState.values.firstWhere((element) => element.name == value);
      if (matched == AdOwnState.NOTIFIED) {
        return Tooltip(
          triggerMode: TooltipTriggerMode.tap,
          message: "买家已付款，请在倒计时结束前点击按钮进行确认。\n若倒计时结束前还未确认，损失由做市商承担",
          child: Text(
            matched.text,
            style: const TextStyle(
              color: Colors.red,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
            ),
          ),
        );
      }
      return Text(
        matched.text,
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }
}
