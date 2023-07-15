import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeAppbar extends StatelessWidget {
  final bool? hasMessage;
  const NoticeAppbar({
    super.key,
    this.hasMessage,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge(
        isLabelVisible: hasMessage == true,
        child: const Icon(Icons.email_outlined),
      ),
      onPressed: () {
        context.push('/notice_window');
        // context.push('/notice_window');
      },
    );
  }
}
