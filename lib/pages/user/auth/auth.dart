import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/pages/user/auth/auth_profile.dart';
import 'package:otc/providers/kyc.provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';

class UserAuth extends ConsumerStatefulWidget {
  const UserAuth({super.key});

  @override
  ConsumerState<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends ConsumerState<UserAuth> {
  static const List<String> statusText = ["未认证", "审核中", "已完成认证"];

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
          Row(
            children: [
              Expanded(child: _buildBasement()),
              const AuthProfile(),
            ],
          ),
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
    final user = ref.read(userProvider);
    final kyc = ref.watch(kycProvider);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 216,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Avatar(
                      avatar: user.avatar,
                      radius: 72 / 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    child: Text(
                      user.nickname,
                      style: Font.largeBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildKycStatus(
                    kyc.lv3Status == KycStatus.pass,
                    kyc.lv3Status == KycStatus.pass,
                    kyc.lv3Status == KycStatus.pass,
                  ),
                ],
              ),
            ),
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
            ),
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

  _buildKycStatus(bool level3, level2, level1) {
    String text = "未认证";
    if (level3) {
      text = items[2]['level'];
    } else if (level2) {
      text = items[1]['level'];
    } else if (level1) {
      text = items[0]['level'];
    }
    return Chip(label: Text(text));
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
