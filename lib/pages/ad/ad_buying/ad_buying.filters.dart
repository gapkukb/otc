import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/constants/currency.dart';

class AdBuyingFilter extends PreferredSize {
  final Map<String, dynamic> formState;
  final Function() onSearch;
  final Function(int time) onAutoChange;
  final int value;

  AdBuyingFilter({
    super.key,
    required this.formState,
    required this.onSearch,
    required this.onAutoChange,
    required this.value,
    // required this.onCompelete,
  }) : super(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            clipBehavior: Clip.none,
            title: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 56,
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
                        height: 56,
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
                        height: 56,
                        child: CurrencySelector(
                          name: "coin",
                          initialValue: Cryptocurrency.USDT.name,
                          formState: formState,
                        ),
                      ),
                      FilledButton.icon(
                        onPressed: onSearch,
                        label: const Icon(Icons.search_outlined),
                        icon: Text("筛选"),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    // height: 60,

                    child: DropdownButton(
                      value: value,
                      underline: const SizedBox.shrink(),
                      icon: const SizedBox.shrink(),
                      iconSize: 0,
                      items: [
                        DropdownMenuItem(
                          value: 0,
                          child: const Text("暂不处理"),
                          onTap: () => onAutoChange(0),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: const Text("5秒自动刷新"),
                          onTap: () => onAutoChange(5),
                        ),
                        DropdownMenuItem(
                          value: 10,
                          child: const Text("10秒自动刷新"),
                          onTap: () => onAutoChange(10),
                        ),
                        DropdownMenuItem(
                          value: 20,
                          child: const Text("20秒自动刷新"),
                          onTap: () => onAutoChange(20),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
