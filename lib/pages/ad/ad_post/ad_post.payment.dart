part of ad_post;

class AdPostPayment extends StatefulWidget {
  const AdPostPayment({super.key});

  @override
  State<AdPostPayment> createState() => _AdPostPaymentState();
}

class _AdPostPaymentState extends State<AdPostPayment> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ModalPageTemplate(
      legend: "发布广告",
      title: "添加收款方式",
      iconData: Icons.ads_click_outlined,
      onCompelete: (_) {},
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: height - 620,
          child: ListView.separated(
            cacheExtent: 100,
            itemBuilder: (context, index) {
              return AdPostBankTemplate(
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
      ],
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
