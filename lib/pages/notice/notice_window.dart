import 'package:flutter/material.dart';

/// 消息弹窗列表
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/pages/notice/notice_item.dart';
import 'package:otc/pages/notice/notice_util.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class NoticeWindow extends StatefulWidget {
  const NoticeWindow({super.key});

  @override
  State<NoticeWindow> createState() => _NoticeWindowState();
}

class _NoticeWindowState extends State<NoticeWindow> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top: AppBar().preferredSize.height),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
            maxHeight: 600,
          ),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    tileColor: Theme.of(context).primaryColor.withAlpha(10),
                    title: Text("0 条新通知"),
                    trailing: UiButton(
                      label: "查看更多",
                      color: const Color(0xffE8DEF8),
                      labelStyle: const TextStyle(color: Colors.deepPurple),
                      onPressed: () {
                        context.go('/notice');
                      },
                    ),
                  ),
                  // NoticeItem(title: "xxxxxxxxxxxx", content: "yyyyyyyyyyyyyyy"),
                  UiEmptyView(
                    icon: SvgPicture.asset(
                      "assets/images/notice_empty.svg",
                      fit: BoxFit.cover,
                      width: 160,
                    ),
                    title: "没有任何新的通知",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
