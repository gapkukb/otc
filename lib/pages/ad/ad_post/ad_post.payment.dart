part of ad_post;

class AdPostPayment extends ConsumerStatefulWidget {
  final bool isBuying;
  const AdPostPayment({
    super.key,
    required this.isBuying,
  });

  @override
  ConsumerState<AdPostPayment> createState() => _AdPostPaymentState();
}

class _AdPostPaymentState extends ConsumerState<AdPostPayment> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final resp = ref.watch(adPostPaymentProvider);

    return ModalPageTemplate(
      legend: "发布广告",
      title: "添加收款方式",
      iconData: Icons.ads_click_outlined,
      onCompelete: (context) {
        context.pop(resp.value!.where((element) => element.selected).toList());
      },
      physics: const NeverScrollableScrollPhysics(),
      children: resp.when(
        error: (_, __) => [
          Text(_.toString() + __.toString()),
        ],
        loading: () => [
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
        data: (data) {
          if (data.isEmpty) {
            return [
              const UiEmptyView(
                title: "当前无可用的收款方式",
              )
            ];
          }
          return [
            SizedBox(
              height: math.min(height - 400, 400),
              child: ListView.separated(
                cacheExtent: 100,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return AdPostPaymentTemplate(
                      isBuying: widget.isBuying,
                      editable: true,
                      data: item,
                      onSelectedChange: (selected) {
                        setState(() {
                          item.selected = selected;
                        });
                      },
                      onLimitChange: (min, max) {
                        setState(() {
                          item.inMax = max;
                          item.inMin = min;
                          item.outMax = max;
                          item.outMin = min;
                        });
                      });
                },
                separatorBuilder: (context, index) {
                  return const Gap.small();
                },
                itemCount: data.length,
              ),
            ),
            const Gap.small(),
            Row(
              children: [
                Expanded(
                  child: _Button(
                    label: "银行卡",
                    onPressed: () async {
                      await context.push(Routes.walletMethodBankAddition);
                    },
                  ),
                ),
                const Gap.small(horizition: true),
                Expanded(
                  child: _Button(
                    label: "支付宝",
                    onPressed: () async {
                      await context.push(Routes.walletMethodQRcodeAddition, extra: AddType.alipay);
                    },
                  ),
                ),
                const Gap.small(horizition: true),
                Expanded(
                  child: _Button(
                    label: "微信",
                    onPressed: () async {
                      await context.push(Routes.walletMethodQRcodeAddition, extra: AddType.wechat);
                    },
                  ),
                ),
              ],
            )
          ];
        },
      ),
    );
  }
}

class _Button extends UiButton {
  const _Button({
    super.label,
    required super.onPressed,
  }) : super(
          fullWidth: true,
          iconData: Icons.add,
          variant: UiButtonVariant.outline,
          size: UiButtonSize.medium,
        );
}

class PaymentItem {
  final String reference;
  final String? username;
  final String name;
  final String title;
  double inMax;
  double inMin;
  double outMax;
  double outMin;
  final String account;
  final String? bank;
  final String? bankBranch;
  final PaymentMethods paymentMethod;
  bool selected;

  PaymentItem({
    required this.reference,
    required this.name,
    required this.title,
    required this.account,
    required this.paymentMethod,
    required this.selected,
    required this.inMax,
    required this.inMin,
    required this.outMax,
    required this.outMin,
    this.username,
    this.bank,
    this.bankBranch,
  });
}
