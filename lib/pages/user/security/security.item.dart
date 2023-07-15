part of security;

class SecurityItem extends StatelessWidget {
  final _Item item;
  const SecurityItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade100,
      title: Text(item.name),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          item.description,
          style: Font.miniGrey,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.value ?? ""),
          item.action,
        ],
      ),
    );
  }
}
