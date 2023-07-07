part of layout;

class SideBar extends StatelessWidget {
  final double width;
  final List<SideBarItem> items;

  const SideBar({
    super.key,
    required this.items,
    this.width = 336,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleSmall;
    final currentPath = GoRouter.of(context).location;

    return Container(
      width: 300,
      color: Colors.white,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final selected = currentPath == item.path;
          final $style =
              !selected ? style : style!.copyWith(fontWeight: FontWeight.bold);

          return ListTile(
            enableFeedback: true,
            enabled: true,
            // tileColor: Colors.deepPurple.shade100,
            selectedTileColor: Colors.deepPurple.shade100,
            selected: selected,
            shape: const StadiumBorder(),
            leading: const Icon(
              Icons.fiber_manual_record,
              size: 18,
              color: Colors.black,
            ),
            title: item.label == null
                ? null
                : Text(
                    item.label!,
                    style: $style,
                  ),
            trailing: item.trailing,
            onTap: () {
              if (item.pathname == null) {
                context.go(item.path);
              } else {
                context.goNamed(item.pathname!);
              }
              item.onTap?.call();
            },
          );
        },
      ),
    );
  }
}
