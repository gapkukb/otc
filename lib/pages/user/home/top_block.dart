import 'package:flutter/material.dart';
import 'package:otc/pages/user/home/indicator.dart';

class UserTopBlock extends StatelessWidget {
  const UserTopBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildBaseInfo(),
        ),
        SizedBox(
          width: 300,
          height: 220,
          child: Card(
            child: Column(
              children: [
                const ListTile(
                  // isThreeLine: true,
                  title: Text("安全等级"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                const Divider(
                  height: 2,
                ),
                Expanded(
                  child: Center(
                    child: Indicator(
                      value: 50,
                      secondarColor: Colors.blue.shade200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Card _buildBaseInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              isThreeLine: true,
              visualDensity: const VisualDensity(vertical: 3),
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              leading: const CircleAvatar(
                radius: 72 / 2,
                backgroundColor: Colors.amber,
                backgroundImage: NetworkImage(
                  "https://th.bing.com/th?id=ORMS.a8f9d726d3d65bdab5013193bd8ef288&pid=Wdp&w=612&h=304&qlt=90&c=1&rs=1&dpr=1&p=0",
                ),
              ),
              title: Row(
                children: [
                  const Text(
                    "狗东西SJ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    iconSize: 18,
                    onPressed: () {},
                  )
                ],
              ),
              subtitle: const Text(
                "用户ID：ASD123456",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "上次登录时间：2022-05-11 18:22:01 IP: 180.232.123.107",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "上次登录时间：2022-05-11 18:22:01 IP: 180.232.123.107",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
