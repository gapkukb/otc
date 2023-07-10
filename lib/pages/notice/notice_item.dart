import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/string.dart';

class NoticeItem extends StatelessWidget {
  final String title;
  final String content;
  const NoticeItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: const Icon(Icons.person_2_outlined),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "2023-07-02 07:30:39",
            style: Font.miniBold,
          ),
          Text(
            title,
            style: Font.medium,
          ),
        ],
      ),
      subtitle: Text(
        content.breakWord,
        style: Font.smallGrey,
      ),
    );
  }
}
