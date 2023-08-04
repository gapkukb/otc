part of ad_history;

class AdHistoryFilters extends PreferredSize {
  final Map<String, dynamic> formState;
  final Function() onCompelete;

  AdHistoryFilters({
    super.key,
    required this.formState,
    required this.onCompelete,
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
                      name: "type",
                      initialValue: 0,
                      data: [
                        DropdownItem(title: "全部", value: 0),
                        DropdownItem(title: "购买", value: 1),
                        DropdownItem(title: "出售", value: 2),
                      ],
                    ),
                  ),
                  // 交易方式
                  SizedBox(
                    width: 150,
                    height: 56,
                    child: Dropdown(
                      labelText: "全部状态",
                      name: "status",
                      initialValue: 0,
                      data: [
                        DropdownItem(title: "全部", value: 0),
                        DropdownItem(title: "已取消", value: 1),
                        DropdownItem(title: "卖家待付款", value: 2),
                        DropdownItem(title: "卖家已付款", value: 3),
                        DropdownItem(title: "买家待付款", value: 4),
                        DropdownItem(title: "买家已付款", value: 5),
                        DropdownItem(title: "审核中", value: 6),
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
            ),
          ),
        );
}
