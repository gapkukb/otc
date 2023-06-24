import 'package:flutter/material.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({super.key});

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  bool _isAuthed = true;

  static List<dynamic> items = [
    {
      "level": "初级认证",
      "checked": false,
      "title": "法币限额50000 USDT 每日，提币限额2000 USDT1每日",
      "subtitle": "要求：1.姓名    2.年龄    3.身份证",
      "onTap": () {}
    },
    {
      "level": "中级认证",
      "checked": false,
      "title": "法币限额 200000 USDT 每日，提币限额 5000 USDT 每日",
      "subtitle": "要求：1.手持身份证照片",
      "onTap": () {}
    },
    {
      "level": "高级认证",
      "checked": false,
      "title": "无限额法币交易，提币限额 10000 USDT 每日",
      "subtitle": "要求：1.手持身份证照片视频",
      "onTap": () {}
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildUser()],
    );
  }

  _buildUser() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                              print('object');
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
        ),
        ...items.map(_buildCard).toList()
      ],
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
          onTap: item['onTap'],
          isThreeLine: true,
          leading: SizedBox(
            width: 24,
            child: Checkbox(
              value: item['checked'],
              onChanged: (value) {},
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
                item['subtitle'],
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
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("去认证"),
              Icon(Icons.arrow_right),
            ],
          )),
    );
  }
}
