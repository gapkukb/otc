part of ad_post;

class AdPostPayment extends ConsumerStatefulWidget {
  const AdPostPayment({super.key});

  @override
  ConsumerState<AdPostPayment> createState() => _AdPostPaymentState();
}

class _AdPostPaymentState extends ConsumerState<AdPostPayment> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final resp = ref.watch(adPostProvider);
    return resp.when(
        error: (_, __) => const Center(
            child: CircularProgressIndicator(),
          ),
        loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        data: (data) {
          return Text("大师傅");
        });
    return ModalPageTemplate(
      legend: "发布广告",
      title: "添加收款方式",
      iconData: Icons.ads_click_outlined,
      onCompelete: (_) {},
      physics: const NeverScrollableScrollPhysics(),
      children: resp.when(
        error: (_, __) => [
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
        loading: () => [
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
        data: (data) {
          
          return [
            SizedBox(
              height: height - 620,
              child: ListView.separated(
                cacheExtent: 100,
                itemBuilder: (context, index) {
                  return const AdPostPaymentTemplate(
                    editable: true,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Gap.small();
                },
                itemCount: 10,
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
    super.key,
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
  final double min;
  final double max;
  final String account;
  final String remark;
  final String username;
  final PaymentMethods paymentMethod;

  PaymentItem({
    required this.min,
    required this.max,
    required this.account,
    required this.remark,
    required this.username,
    required this.paymentMethod,
  });
}
