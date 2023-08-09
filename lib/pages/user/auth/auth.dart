library auth;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';

part './auth.helper.dart';

class UserAuth extends ConsumerStatefulWidget {
  const UserAuth({super.key});

  @override
  ConsumerState<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends ConsumerState<UserAuth> {
  static const List<Map<String, dynamic>> statusText = [
    {"text": "审核中", "color": Colors.red},
    {"text": "已完成认证", "color": Colors.green},
    {"text": "未认证", "color": Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    final kyc = ref.watch(kycProvider);

    final List<dynamic> items = [
      {
        "level": "初级认证",
        "status": kyc?.lv1Status ?? KycStatus.reject,
        "title": "提币限额2000 USDT1每日",
        // "title": "法币限额50000 USDT 每日，提币限额2000 USDT1每日",
        "precondition": true,
        "subtitle": "要求：1.姓名    2.年龄    3.身份证",
        "onTap": (BuildContext context) {
          context.push(Routes.authPrimary);
        }
      },
      {
        "level": "中级认证",
        "status": kyc?.lv2Status ?? KycStatus.reject,
        "title": "法币限额 200000 USDT 每日，提币限额 5000 USDT 每日",
        "precondition": kyc?.lv1Status == KycStatus.pass,
        "subtitle": "要求：1.手持身份证照片",
        "onTap": (BuildContext context) {
          context.pushNamed(Routes.authJunior);
        }
      },
      {
        "level": "高级认证",
        "status": kyc?.lv3Status ?? KycStatus.reject,
        "title": "无限额法币交易，提币限额 10000 USDT 每日",
        "subtitle": "要求：1.手持身份证照片视频",
        "precondition": kyc?.lv2Status == KycStatus.pass,
        "onTap": (BuildContext context) {
          context.pushNamed(Routes.authSenior);
        }
      },
    ];

    return Material(
      color: Colors.grey.shade50,
      child: SingleChildScrollView(
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
      ),
    );
  }

  Card _buildBasement() {
    final user = ref.read(userBaseProvider);
    final kyc = ref.read(kycProvider);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 140,
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
                    kyc?.lv1Status == KycStatus.pass,
                    kyc?.lv2Status == KycStatus.pass,
                    kyc?.lv3Status == KycStatus.pass,
                  ),
                ],
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
                  _buildItem("数字货币充值限额", "无限额", true),
                  _buildItem("数字货币提币限额", "0 USDT 每日", true),
                  _buildItem("法币充值&提现限额", "0 USDT 每日", true),
                  _buildItem("C2C交易限额", "无限额", true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItem(String label, String value, [bool? style]) {
    return Cell(
      height: 30,
      titleText: label,
      trailingText: value,
      trailingTextStyle: style == true ? Font.smallGrey : null,
    );
  }

  _buildKycStatus(bool level1, level2, level3) {
    String text = "未认证";
    if (level3) {
      text = "高级认证";
    } else if (level2) {
      text = "中级认证";
    } else if (level1) {
      text = "初级认证";
    }
    return Chip(
      label: Text(text),
      backgroundColor: text == "未认证" ? Theme.of(context).disabledColor : Theme.of(context).primaryColor,
      labelStyle: const TextStyle(color: Colors.white),
      side: const BorderSide(color: Colors.transparent),
      shape: const StadiumBorder(),
    );
  }

  _buildCard(dynamic item) {
    final enble = (item['status'] == null || item['status'] == KycStatus.reject) && item["precondition"];
    final config = statusText[(item['status'] as KycStatus).index];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: enble ? null : Colors.grey.shade100,
      child: ListTile(
        onTap: enble ? () => item['onTap'](context) : null,
        isThreeLine: true,
        contentPadding: const EdgeInsets.only(left: 8),
        leading: SizedBox(
          width: 24,
          child: Checkbox(
            value: item['status'] == KycStatus.pass,
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
              config["text"],
              style: TextStyle(
                color: config["color"],
              ),
            ),
            const Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
