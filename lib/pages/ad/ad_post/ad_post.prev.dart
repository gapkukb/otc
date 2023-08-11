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
    controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.type == AdPostType.selling ? 0 : 1,
    );
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
    final double max = rate + 0.1;
    final double min = rate - 0.1;

    return ModalPageTemplate(
      title: "发布新广告",
      iconData: Icons.ads_click_outlined,
      okButtonText: "下一步",
      onCompelete: (context) {
        widget.formState.update(
          "refRate",
          (value) => rate,
          ifAbsent: () => rate,
        );
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
        Card(
          child: Padding(
            padding: Pads.sm,
            child: SizedBox(
              height: 46,
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("币种"),
                        Gap.mini(),
                        Text("USDT", style: Font.miniGrey),
                      ],
                    ),
                  ),
                  const VerticalDivider(thickness: 1, width: 33),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("用法币"),
                        Gap.mini(),
                        Text("CNY", style: Font.miniGrey),
                      ],
                    ),
                  ),
                  const VerticalDivider(thickness: 1, width: 33),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text("参考价格"),
                            Tip(
                              message: "平台针对实时汇率给出的指导价格",
                              iconSize: 18,
                            )
                          ],
                        ),
                        const Gap.mini(),
                        Text("￥ ${rate.toString()}", style: Font.miniGrey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Gap.medium(),
        const Text("价格类型", style: Font.smallGrey),
        AdPostRange(
          rate: rate,
          name: "floatOffset",
          formState: widget.formState,
        ),
        const Gap.mini(),
        Text("可设定的价格区间是${min.toStringAsFixed(2)}~${max.toStringAsFixed(2)}", style: Font.smallGrey),
        UiTextFormField(
          labelText: "请输入${widget.type == AdPostType.selling ? "出售" : "购买"}数量",
          name: "amount",
          formState: widget.formState,
          validator: (value) {
            return value?.isEmpty == true ? "请输入数量" : null;
          },
        ),
      ],
    );
  }
}
