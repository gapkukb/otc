import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/router/router.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({super.key});

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  bool _isAuthed = false;

  static const List<String> statusText = ["未认证", "审核中", "已完成认证 "];

  static List<dynamic> items = [
    {
      "level": "初级认证",
      "status": 1,
      "title": "法币限额50000 USDT 每日，提币限额2000 USDT1每日",
      "subtitle": "要求：1.姓名    2.年龄    3.身份证",
      "onTap": (BuildContext context) {
        context.push('/auth_primary');
      }
    },
    {
      "level": "中级认证",
      "status": 0,
      "title": "法币限额 200000 USDT 每日，提币限额 5000 USDT 每日",
      "subtitle": "要求：1.手持身份证照片",
      "onTap": (BuildContext context) {
        context.push('/auth_junior');
      }
    },
    {
      "level": "高级认证",
      "status": 0,
      "title": "无限额法币交易，提币限额 10000 USDT 每日",
      "subtitle": "要求：1.手持身份证照片视频",
      "onTap": (BuildContext context) {
        context.push('/auth_senior');
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBasement(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            // separatorBuilder: (context, index) => const SizedBox(height: 0),
            itemBuilder: (context, index) {
              return _buildCard(items[index]);
            },
          )
        ],
      ),
    );
  }

  Card _buildBasement() {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "狗东西SJ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  child: Chip(
                    backgroundColor: _isAuthed ? Colors.blue : Colors.grey,
                    label: Text(
                      "未认证",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      side: BorderSide.none,
                    ),
                  ),
                  onTap: _isAuthed
                      ? null
                      : () {
                          // /auth_senior
                          context.push('/auth_junior');
                        },
                ),
              ],
            ),
            const SizedBox(width: 32),
            const SizedBox(
              height: 160,
              child: VerticalDivider(
                width: 0.1,
                color: Colors.black45,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "账户限额",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildItem(),
                  _buildItem(),
                  _buildItem(),
                  _buildItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [Text("数字货币充值限额"), Spacer(), Text("无限额")],
      ),
    );
  }

  _buildCard(dynamic item) {
    var isUnAuth = item['status'] == 0;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: isUnAuth ? null : Colors.grey.shade100,
      child: ListTile(
          onTap: !isUnAuth ? null : () => item['onTap'](context),
          isThreeLine: true,
          contentPadding: const EdgeInsets.only(left: 8),
          leading: SizedBox(
            width: 24,
            child: Checkbox(
              value: !isUnAuth,
              onChanged: null,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['level'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
          subtitle: Text(
            item['subtitle'],
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                statusText[item['status']],
                style:
                    TextStyle(color: item['status'] == 1 ? Colors.red : null),
              ),
              const Icon(Icons.arrow_right),
            ],
          )),
    );
  }
}
