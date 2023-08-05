part of ad_post;

class AdPostPaymentTemplate extends StatelessWidget {
  final bool isBuying;
  final bool? editable;
  final PaymentItem data;
  final Function(bool selected)? onSelectedChange;
  const AdPostPaymentTemplate({
    super.key,
    this.editable,
    required this.data,
    this.onSelectedChange,
    required this.isBuying,
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
          color: activebale ? const Color(0xfff8f5ff) : Colors.grey.shade100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: activebale ? const Color(0xfff0ecfe) : Colors.grey.shade300,
                child: DefaultTextStyle(
                  style: Font.miniGrey,
                  child: Cell(
                    padding: Pads.leftXs,
                    align: MainAxisAlignment.spaceBetween,
                    titleText: "默认订单限制 $min CNY ~ $max CNY",
                    height: 32,
                    trailing: editable == true
                        ? GestureDetector(
                            onTap: () async {
                              final result = await onEdit(context, min, max);
                              if (result?.isNotEmpty == true) {}
                            },
                            child: const Icon(Icons.edit_note_outlined),
                          )
                        : GestureDetector(
                            onTap: onDelete,
                            child: SizedBox(
                              width: 32,
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ad_close_button.svg",
                                    fit: BoxFit.cover,
                                  ),
                                  const Align(
                                    alignment: Alignment(0.5, 0),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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
            maxWidth: 300,
            onCompelete: (context) {
              formKey.currentState!.save();
              if ((double.tryParse(formState['max']!) ?? 0) - (double.tryParse(formState['min']!) ?? 0) < 0) {
                Modal.showText(text: "最大值不可小于最小值");
              } else {
                context.pop(formState);
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

  onDelete() {
    Modal.confirm(
      content: "确认删除该收款方式?",
      okButtonText: "删除",
      okButtonVariant: UiButtonVariant.filled,
      onOk: () {},
    );
  }
}
