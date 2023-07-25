import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/date_picker/date_picker.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/pages/ad/ad_post/ad_post.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';

class AdBuyingHeader extends PreferredSize {
  AdBuyingHeader({
    super.key,
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
                        child: CurrencySelector(name: "name"),
                      ),
                      //交易类型
                      SizedBox(
                        width: 150,
                        height: 56,
                        child: Dropdown(
                          labelText: "交易类型",
                          name: "",
                          data: [
                            DropdownItem(title: "购买", value: 0),
                            DropdownItem(title: "出售", value: 1),
                          ],
                        ),
                      ),
                      // 交易方式
                      SizedBox(
                        width: 150,
                        height: 56,
                        child: Dropdown(
                          labelText: "全部状态",
                          name: "",
                          data: [
                            DropdownItem(title: "已上架", value: 0),
                            DropdownItem(title: "卖家待支付", value: 1),
                          ],
                        ),
                      ),
                      DatePicker(
                        labelText: "开始日期",
                        maxDate: DateTime.now(),
                        minDate: DateTime(1970),
                      ),
                      DatePicker(
                        labelText: "结束日期",
                        maxDate: DateTime.now(),
                        minDate: DateTime(1970),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      UiButton.text(
                        onPressed: () {},
                        label: "历史广告",
                      ),
                      UiButton(
                        label: "发布新广告",
                        onPressed: () {
                          GoRouter.of(navigatorKey.currentContext!).pushNamed(
                            Routes.adPost,
                            extra: AdPostType.buying,
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
}
