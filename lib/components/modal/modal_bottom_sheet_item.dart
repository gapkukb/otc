part of modal;

class BottomSheetItem {
  String label;
  String? helper;
  dynamic value;
  bool disabled;
  Map<String, dynamic>? extra;
  Function()? onTap;
  BottomSheetItem({
    required this.label,
    this.disabled = false,
    this.helper,
    this.value,
    this.onTap,
    this.extra,
  });
}

modalShowBottomSheet({
  required List<BottomSheetItem> items,
  required Function(dynamic value, BottomSheetItem item) onSelected,
  bool? dense,
}) {
  var style = const TextStyle(fontSize: 12, color: Colors.grey);
  showModalBottomSheet(
    useSafeArea: true,
    constraints: const BoxConstraints.tightFor(),
    context: navigatorKey.currentContext!,
    backgroundColor: Colors.transparent,
    isScrollControlled: false,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Card(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(
                    height: 0,
                    thickness: 1,
                    indent: 8,
                    endIndent: 8,
                  ),
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return ListTile(
                      dense: dense,
                      enabled: !item.disabled,
                      title: Text(item.label, textAlign: TextAlign.center),
                      subtitle: item.helper == null
                          ? null
                          : Text(
                              item.helper!,
                              textAlign: TextAlign.center,
                              style: style,
                            ),
                      onTap: () {
                        Navigator.pop(context);
                        item.onTap?.call();
                        onSelected(item.value ?? item.label, item);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: MaterialButton(
              child: const Text("取消", textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      );
    },
  );
}
