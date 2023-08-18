part of ad_post;

class AdPostNext extends ConsumerStatefulWidget {
  final Map<String, dynamic> formState;
  final GlobalKey<FormState> formKey;
  final AdPostType type;
  const AdPostNext({
    super.key,
    required this.formState,
    required this.type,
    required this.formKey,
  });

  @override
  ConsumerState<AdPostNext> createState() => _AdPostNextState();
}

class _AdPostNextState extends ConsumerState<AdPostNext> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    ref.invalidate(adPostPaymentProvider);
    super.dispose();
  }

  List<PaymentItem> payments = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final resp = ref.watch(adPostPaymentProvider);
    final isBuying = widget.type == AdPostType.buying;

    return ModalPageTemplate(
      legend: "发布新广告",
      title: "${isBuying ? "购买" : "出售"}USDT",
      iconData: Icons.ads_click_outlined,
      okButtonText: "继续",
      onCompelete: (context) async {
        if (payments.isEmpty) {
          Modal.showText(text: "请添加收款方式");
          return;
        }
        if (widget.formKey.currentState!.validate()) {
          widget.formKey.currentState!.save();
          final List<String> keys = [];
          final List<Image> icons = [];

          for (var method in payments) {
            if (keys.contains(method.paymentMethod.value)) {
              continue;
            }
            keys.add(method.paymentMethod.value);
            icons.add(
              method.paymentMethod.icon(),
            );
          }
          final isBuying = widget.type == AdPostType.buying;

          final ok = await adPostSubmit(context, icons, {
            ...widget.formState,
            "channels": payments
                .map((payment) => {
                      "reference": payment.reference,
                      "finalRate": widget.formState['refRate'] + widget.formState['floatOffset'],
                      "min": isBuying ? payment.outMin : payment.inMin,
                      "max": isBuying ? payment.outMax : payment.inMax,
                      "title": payment.title,
                    })
                .toList()
          });

          if (ok == true) {
            context.pop(true);
          }
        }
      },
      physics: const NeverScrollableScrollPhysics(),
      maxWidth: 624,
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
          return [
            DottedBorder(
              dashPattern: const [6],
              child: UiButton.text(
                iconData: Icons.add,
                fullWidth: true,
                label: "添加收款方式",
                onPressed: () async {
                  payments = (await context.push<List<PaymentItem>>(
                    Routes.adPostPayment,
                    extra: isBuying,
                  ))!;
                },
              ),
            ),
            const Gap.small(),
            if (payments.isEmpty)
              const UiEmptyView(
                title: "您还没有添加收款方式",
              )
            else
              SizedBox(
                height: math.min(height - 400, 400),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    height: 92,
                  ),
                  itemCount: payments.length,
                  itemBuilder: (context, index) {
                    final item = payments[index];
                    return AdPostPaymentTemplate(
                      isBuying: isBuying,
                      data: item,
                      editable: false,
                      onDelete: (item) {
                        setState(() {
                          item.selected = false;
                          payments.remove(item);
                        });
                      },
                    );
                  },
                ),
              ),
            const Gap.small(),
            Dropdown(
              name: "validTime",
              formState: widget.formState,
              initialValue: 15 * 60,
              data: [
                DropdownItem(title: "15分钟支付时效", value: 15 * 60),
                DropdownItem(title: "30分钟支付时效", value: 30 * 60),
              ],
            )
          ];
        },
      ),
    );
  }
}
