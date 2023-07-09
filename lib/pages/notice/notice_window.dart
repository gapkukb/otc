import 'package:flutter/material.dart';

/// 消息弹窗列表
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              ListTile(
                tileColor: Theme.of(context).primaryColor.withAlpha(10),
                title: Text("0 条新通知"),
                trailing: UiButton(
                  onPressed: () {},
                  label: "查看更多",
                  color: Color(0xffE8DEF8),
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
              NoticeItem(title: "xxxxxxxxxxxx", content: "yyyyyyyyyyyyyyy"),
              UiEmptyView(
                icon: Icon(
                  Icons.description_outlined,
                  size: 108,
                  color: Colors.purple,
                ),
                title: "没有任何新的通知",
              )
            ],
          ),
        ),
      ),
    );
  }
}
