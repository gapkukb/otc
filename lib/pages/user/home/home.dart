import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/components/tip/tip.dart';
import 'package:otc/pages/user/home/fee.dart';
import 'package:otc/pages/user/home/indicator.dart';
import 'package:otc/pages/user/home/log.dart';
import 'package:otc/pages/user/home/overview.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        "狗东西SJ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                      )
                    ],
                  ),
                  subtitle: Text("用户ID：ASD123456"),
                  leading: Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/thumb/8/86/Avatar_Aang.png/220px-Avatar_Aang.png"),
                ),
                SizedBox(height: 24),
                Text("上次登录时间：2022-05-11 18:22:01 IP: 180.232.123.107"),
                SizedBox(height: 16),
                Text("上次登录时间：2022-05-11 18:22:01 IP: 180.232.123.107"),
                SizedBox(height: 32),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text("安全等级"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  subtitle: Divider(),
                ),
                Indicator(
                  value: 50,
                  secondarColor: Colors.blue.shade200,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/WaveHeader.png"),
                    ),
                  ),
                  child: ListTile(
                    tileColor: Colors.transparent,
                    title: Row(
                      children: [
                        const Text(
                          "验证您的账户",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Tip(message: "阿西吧"),
                      ],
                    ),
                    subtitle: const Text(
                      "通过认证，得更高交易额度",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    trailing: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xff016452),
                      ),
                      child: const Text(
                        "去KYC认证",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        context.go("/c2c");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Overview(),
          const Fee(),
          const Log(),
        ],
      ),
    );
  }
}
