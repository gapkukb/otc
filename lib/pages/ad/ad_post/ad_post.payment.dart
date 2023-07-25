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
            itemCount: 100,
          ),
        ),
        const Gap.small(),
        Row(
          children: [
            Expanded(
              child: UiButton(
                onPressed: () {},
                label: "银行卡",
                fullWidth: true,
                iconData: Icons.add,
                variant: UiButtonVariant.outline,
                size: UiButtonSize.medium,
              ),
            ),
            const Gap.small(horizition: true),
            Expanded(
              child: UiButton(
                onPressed: () {},
                label: "支付宝",
                fullWidth: true,
                iconData: Icons.add,
                variant: UiButtonVariant.outline,
                size: UiButtonSize.medium,
              ),
            ),
            const Gap.small(horizition: true),
            Expanded(
              child: UiButton(
                onPressed: () {},
                label: "微信",
                fullWidth: true,
                iconData: Icons.add,
                variant: UiButtonVariant.outline,
                size: UiButtonSize.medium,
              ),
            ),
          ],
        )
      ],
    );
  }
}
