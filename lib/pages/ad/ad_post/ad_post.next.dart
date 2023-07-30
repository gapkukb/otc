part of ad_post;

class AdPostNext extends StatefulWidget {
  final Map<String, dynamic> formState;
  final AdPostType type;
  const AdPostNext({
    super.key,
    required this.formState,
    required this.type,
  });

  @override
  State<AdPostNext> createState() => _AdPostNextState();
}

class _AdPostNextState extends State<AdPostNext> with SingleTickerProviderStateMixin {
  late final TabController controller;
  final List<dynamic> _items = [
    {"value": 100, "unit": "USDT"},
    {"value": 200, "unit": "USDT"},
    {"value": 500, "unit": "USDT"},
    {"value": 1000, "unit": "USDT"},
    {"value": 2000, "unit": "USDT"},
    {"value": 5000, "unit": "USDT"},
    {"value": 10000, "unit": "USDT"},
    {"value": 20000, "unit": "USDT"},
  ];
  late int _value;

  late String gender = "male";

  @override
  void initState() {
    _value = _items[0]['value'];
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
    final height = MediaQuery.of(context).size.height;
    return ModalPageTemplate(
      legend: "发布新广告",
      title: "出售USDT",
      iconData: Icons.ads_click_outlined,
      okButtonText: "继续",
      onCompelete: (_) {},
      physics: const NeverScrollableScrollPhysics(),
      maxWidth: 624,
      children: [
        DottedBorder(
          dashPattern: const [6],
          child: UiButton.text(
            iconData: Icons.add,
            fullWidth: true,
            label: "添加收款方式",
            onPressed: () {
              context.push(Routes.adPostPayment);
            },
          ),
        ),
        const Gap.small(),
        SizedBox(
          height: height - 500,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              height: 92,
            ),
            itemCount: 100,
            itemBuilder: (context, index) {
              return AdPostBankTemplate();
            },
          ),
        ),
        const Gap.small(),
        Dropdown(
          name: "",
          initialValue: 0,
          data: [
            DropdownItem(title: "15分钟", value: 0),
            DropdownItem(title: "30分钟", value: 1),
          ],
        )
      ],
    );
  }
}
