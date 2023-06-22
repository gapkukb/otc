import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserRebate extends StatefulWidget {
  const UserRebate({super.key});

  @override
  State<UserRebate> createState() => _UserRebateState();
}

class _UserRebateState extends State<UserRebate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              context.go("/tasks");
            },
            child: Text("调整")),
        _buildInfo(),
      ],
    );
  }

  _buildInfo() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "推荐做市商,每人获得100 USDT奖励",
              style: TextStyle(
                color: Color(0xffA0AFC4),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "推荐好友加入做市商联盟",
              style: TextStyle(
                color: Color(0xffA0AFC4),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "上次登录时间：2022-05-11 18:22:01 IP: 180.232.123.107",
              style: TextStyle(
                color: Color(0xffA0AFC4),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "账户创建时间：2022-05-11 18:22:01 1P: 180.232.123.221",
              style: TextStyle(
                color: Color(0xffA0AFC4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
