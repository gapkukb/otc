part of ad_post;

class AdPostPrev extends StatefulWidget {
  final Map<String, dynamic> formState;
  final AdPostType type;

  const AdPostPrev({
    super.key,
    required this.formState,
    required this.type,
  });

  @override
  State<AdPostPrev> createState() => _AdPostPrevState();
}

class _AdPostPrevState extends State<AdPostPrev> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double start = 30.0;
  double end = 50.0;
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "发布新广告",
      title: "发布",
      iconData: Icons.ads_click_outlined,
      okButtonText: "发布",
      onCompelete: (_) {},
      physics: NeverScrollableScrollPhysics(),
      children: [
        // UnconstrainedBox(
        //   child: SizedBox(
        //     height: 60,
        //     child: TabBar(
        //       controller: controller,
        //       tabs: [
        //         Tab(text: "出售"),
        //         Tab(text: "购买"),
        //       ],
        //     ),
        //   ),
        // ),
        Card(
          child: const Cell(
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
        Gap.medium(),
        Text("参考价格"),
        Gap.mini(),
        Text("￥ 7.01"),
        Gap.medium(),
        Gap.medium(),
        Text("价格类型"),
        AdPostRange(
          max: 700 * (1 + 0.01),
          min: 700 * (1 - 0.01),
          initValue: 700,
        ),
        Gap.mini(),
        Text("可设定的价格区间是6.91~7.11"),
      ],
    );
  }
}
