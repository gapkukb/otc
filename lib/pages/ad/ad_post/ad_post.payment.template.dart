part of ad_post;

class AdPostPaymentTemplate extends StatelessWidget {
  final bool? editable;
  const AdPostPaymentTemplate({
    super.key,
    this.editable,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Colors.grey.shade100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.grey.shade300,
              child: DefaultTextStyle(
                style: Font.miniGrey,
                child: Cell(
                  padding: Pads.leftXs,
                  align: MainAxisAlignment.spaceBetween,
                  titleText: "默认订单限制 100 CNY ~ 10000 CNY",
                  height: 32,
                  trailing: editable == true
                      ? GestureDetector(
                          onTap: () async {
                            final result = await onEdit(context);
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
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              title: UiChip(
                iconWidget: FlutterLogo(
                  size: 12,
                ),
                text: "工商银行",
                textStyle: Font.mediumBold,
              ),
              height: 32,
              trailingText: "6222 2222 2222 0092",
              trailingTextStyle: Font.mediumBold,
            ),
            Cell(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              titleText: "新卡可刷",
              height: 24,
              trailingText: "狗鸡",
              titleTextStyle: Font.miniGrey,
              trailingTextStyle: Font.miniGrey,
            ),
          ],
        ),
      ),
    );
  }

  onEdit(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final Map<String, dynamic> formState = {};
    return showDialog(
      context: context,
      builder: (context) {
        return Form(
          key: formKey,
          child: ModalPageTemplate(
            legend: "添加收款方式",
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
                    ),
                  ),
                  const Gap.small(horizition: true),
                  Expanded(
                    child: UiTextFormField(
                      keyboardType: TextInputType.number,
                      name: "max",
                      labelText: "最大",
                      formState: formState,
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
