part of ad_post;

class AdPostPaymentTemplate extends StatelessWidget {
  final bool isBuying;
  final bool? editable;
  final PaymentItem data;
  final Function(PaymentItem item)? onDelete;
  final Function(bool selected)? onSelectedChange;
  final Function(double min, double max)? onLimitChange;
  const AdPostPaymentTemplate({
    super.key,
    this.editable,
    required this.data,
    this.onSelectedChange,
    required this.isBuying,
    this.onDelete,
    this.onLimitChange,
  });

  @override
  Widget build(BuildContext context) {
    final activebale = data.selected && editable == true;
    final min = isBuying ? data.inMin : data.outMin;
    final max = isBuying ? data.inMax : data.outMax;

    return GestureDetector(
      onTap: editable == true ? () => onSelectedChange?.call(!data.selected) : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Material(
          color: activebale ? Colors.blue.shade50 : Colors.grey.shade100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: activebale ? Colors.blue.shade100 : Colors.grey.shade300,
                child: DefaultTextStyle(
                  style: Font.miniGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: Pads.xAxisXs,
                            child: Text(
                              "默认订单限制 $min CNY ~ $max CNY",
                              textAlign: TextAlign.left,
                              style: Font.mini,
                            ),
                          ),
                        ),
                      ),
                      editable == true
                          ? GestureDetector(
                              onTap: () async {
                                final result = await onEdit(context, min, max);
                                if (result?.isNotEmpty == true) {
                                  onLimitChange?.call(result!["min"]!, result["max"]!);
                                }
                              },
                              child: const Icon(Icons.edit_note_outlined),
                            )
                          : GestureDetector(
                              onTap: _delete,
                              child: SizedBox(
                                width: 32,
                                child: Stack(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/ad_close_button.svg",
                                      fit: BoxFit.cover,
                                    ),
                                    const Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Align(
                                        alignment: Alignment(0.5, 0),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Cell(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                title: UiChip(
                  iconWidget: data.paymentMethod.icon,
                  text: data.paymentMethod.text,
                  textStyle: Font.mediumBold,
                ),
                height: 32,
                trailingText: data.account,
                trailingTextStyle: Font.mediumBold,
              ),
              Cell(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                title: FittedBox(
                  child: Text(
                    (data.bankBranch ?? "") + data.title,
                    style: Font.miniGrey,
                  ),
                ),
                height: 24,
                trailingText: data.username ?? data.name,
                trailingTextStyle: Font.miniGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, double>?> onEdit(BuildContext context, double min, double max) {
    final formKey = GlobalKey<FormState>();
    final Map<String, dynamic> formState = {};

    return showDialog<Map<String, double>>(
      context: context,
      builder: (context) {
        return Form(
          key: formKey,
          child: ModalPageTemplate(
            legend: "",
            title: "修改订单限制",
            iconData: Icons.wallet,
            maxWidth: 500,
            onCompelete: (context) {
              formKey.currentState!.save();
              final $max = double.tryParse(formState['max']!) ?? 0;
              final $min = double.tryParse(formState['min']!) ?? 0;
              if ($max - $min < 0) {
                Modal.showText(text: "最大值不可小于最小值");
              } else {
                context.pop({
                  "min": $min,
                  "max": $max,
                });
              }
            },
            children: [
              Row(
                children: [
                  Expanded(
                    child: UiTextFormField(
                      keyboardType: TextInputType.number,
                      name: "min",
                      labelText: "最小",
                      formState: formState,
                      initialValue: min.toString(),
                      validator: (value) {
                        try {
                          if (double.parse(value!) < min) {
                            return "订单限额不得低于$min";
                          }
                          return null;
                        } catch (e) {
                          return "请输入最低限额";
                        }
                      },
                    ),
                  ),
                  const Gap.small(horizition: true),
                  Expanded(
                    child: UiTextFormField(
                      keyboardType: TextInputType.number,
                      name: "max",
                      labelText: "最大",
                      formState: formState,
                      initialValue: max.toString(),
                      validator: (value) {
                        try {
                          if (double.parse(value!) > max) {
                            return "订单限额不得高于$max";
                          }
                          return null;
                        } catch (e) {
                          return "请输入最高限额";
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _delete() {
    Modal.confirm(
      content: "确认删除该收款方式?",
      okButtonText: "删除",
      okButtonVariant: UiButtonVariant.filled,
      onOk: () => onDelete?.call(data),
    );
  }
}
