import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/components/row_gap/row_gap.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/widgets/ui_button.dart';

class AdBuyingFilter extends PreferredSize {
  final Map<String, dynamic> formState;
  final Function() onSearch;
  final Function(int time) onAutoChange;
  final int value;
  final bool isBuying;

  AdBuyingFilter({
    super.key,
    required this.formState,
    required this.onSearch,
    required this.onAutoChange,
    required this.value,
    required this.isBuying,
    // required this.onCompelete,
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
                    height: 48,
                    child: Dropdown(
                        labelText: "法币",
                        name: "money",
                        formState: formState,
                        initialValue: Fiatcurrency.CNY.name,
                        props: PopupProps.menu(
                          disabledItemFn: (item) => item.value != Fiatcurrency.CNY.name,
                        ),
                        data: Fiatcurrency.values.map((item) {
                          return DropdownItem(
                            title: item.text,
                            value: item.name,
                          );
                        }).toList()),
                  ),
                  // 交易方式
                  SizedBox(
                    width: 150,
                    height: 48,
                    child: Dropdown(
                      labelText: "支付方式",
                      name: "paymentMethod",
                      formState: formState,
                      initialValue: "all",
                      data: PaymentMethods.values.map((payment) {
                        return DropdownItem(
                          title: payment.text,
                          value: payment.value,
                        );
                      }).toList()
                        ..insert(
                          0,
                          DropdownItem(
                            title: "全部",
                            value: "all",
                          ),
                        ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 48,
                    child: CurrencySelector(
                      name: "coin",
                      initialValue: Cryptocurrency.USDT.name,
                      formState: formState,
                    ),
                  ),
                  UiButton.text(
                    onPressed: onSearch,
                    label: "筛选",
                    height: 56,
                  )
                ],
              ),
            ),
          ),
        );
}
