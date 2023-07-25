part of ad_post;

class AdPostBankTemplate extends StatelessWidget {
  final bool? editable;
  const AdPostBankTemplate({
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
                          onTap: () => onEdit(context),
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
    // Modal.showWidget(
    //   toastBuilder: (cancelFunc) {
    //     return Material(
    //       child: Row(
    //         children: [
    //           UiTextFormField(
    //             name: "min",
    //             labelText: "最小",
    //           ),
    //           UiTextFormField(
    //             name: "max",
    //             labelText: "最大",
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("修改订单限制"),
          actions: [
            UiButton.text(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              label: "取消",
              size: UiButtonSize.small,
            ),
            UiButton.text(
              onPressed: () {},
              label: "确定",
              size: UiButtonSize.small,
            ),
          ],
          content: SizedBox(
            width: 328,
            child: Row(
              children: [
                Expanded(
                  child: UiTextFormField(
                    name: "min",
                    labelText: "最小",
                  ),
                ),
                const Gap.small(horizition: true),
                Expanded(
                  child: UiTextFormField(
                    name: "min",
                    labelText: "最小",
                  ),
                ),
              ],
            ),
          ),
        );
        return Row(
          children: [
            UiTextFormField(
              name: "min",
              labelText: "最小",
            ),
            UiTextFormField(
              name: "max",
              labelText: "最大",
            ),
          ],
        );
      },
    );
  }

  onDelete() {}
}
