part of ad_post;

class AdPostPrev extends ConsumerStatefulWidget {
  final Map<String, dynamic> formState;
  final AdPostType type;
  final Function(bool isBuying) onCompelete;

  const AdPostPrev({
    super.key,
    required this.formState,
    required this.type,
    required this.onCompelete,
  });

  @override
  ConsumerState<AdPostPrev> createState() => _AdPostPrevState();
}

class _AdPostPrevState extends ConsumerState<AdPostPrev> with SingleTickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    apis.otc
        .rate(
            null,
            HttpOptions(
              pathParams: {
                "from": Cryptocurrency.USDT.name,
                "to": Fiatcurrency.CNY.name,
              },
            ))
        .then((value) {
      ref.read(rateProvider.notifier).state = value;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rate = ref.watch(rateProvider);
    final double max = rate * (1 + 0.01);
    final double min = rate * (1 - 0.01);

    return ModalPageTemplate(
      legend: "发布新广告",
      iconData: Icons.ads_click_outlined,
      okButtonText: "下一步",
      onCompelete: (_) {
        widget.onCompelete(controller.index != 0);
      },
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 60,
          child: TabBar(
            controller: controller,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: "出售"),
              Tab(text: "购买"),
            ],
          ),
        ),
        const Divider(height: 1),
        const Gap.small(),
        const Card(
          child: Cell(
            height: 84,
            padding: Pads.sm,
            evenly: true,
            align: MainAxisAlignment.start,
            divider: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("币种"),
                Gap.mini(),
                Text("USDT"),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("用法币"),
                Gap.mini(),
                Text("CNY"),
              ],
            ),
          ),
        ),
        const Gap.medium(),
        const Text("参考价格", style: Font.smallGrey),
        const Gap.mini(),
        Text("￥ $rate", style: Font.mediumBold),
        const Gap.medium(),
        const Text("价格类型", style: Font.smallGrey),
        AdPostRange(
          max: max,
          min: min,
          initValue: rate,
          name: "price",
          formState: widget.formState,
        ),
        const Gap.mini(),
        Text("可设定的价格区间是${min.toStringAsFixed(2)}~${max.toStringAsFixed(2)}", style: Font.smallGrey),
      ],
    );
  }
}
