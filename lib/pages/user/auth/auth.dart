import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/providers/kyc_configuration.provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';

class UserAuth extends ConsumerWidget {
  const UserAuth({super.key});

  static const List<Map<String, dynamic>> statusText = [
    {"text": "审核中", "color": Colors.red},
    {"text": "已完成认证", "color": Colors.green},
    {"text": "未认证", "color": Colors.grey},
  ];

  @override
  Widget build(context, ref) {
    final user = ref.read(userBaseProvider);
    final kyc = ref.watch(kycProvider);
    final conf = ref.watch(kycConfigurationProvider);

    final List<_Item> items = [
      _Item(
        status: KycStatus.reject,
        precondition: true,
        withdrawLimit: 0,
        transferLimit: 0,
        title: "未认证",
        requirement: "要求：1.姓名 2.年龄 3.身份证",
        onTap: (BuildContext context) {
          context.push(Routes.authPrimary);
        },
      ),
      _Item(
        status: kyc?.lv1Status ?? KycStatus.reject,
        precondition: true,
        withdrawLimit: conf.dailyWithdrawKycLv1,
        transferLimit: conf.dailyTransferKycLv1,
        title: "初级认证",
        requirement: "要求：1.姓名 2.年龄 3.身份证",
        onTap: (BuildContext context) {
          context.push(Routes.authPrimary);
        },
      ),
      _Item(
        status: kyc?.lv2Status ?? KycStatus.reject,
        precondition: kyc?.lv1Status == KycStatus.pass,
        withdrawLimit: conf.dailyWithdrawKycLv2,
        transferLimit: conf.dailyTransferKycLv2,
        title: "中级认证",
        requirement: "要求：1.手持身份证照片",
        onTap: (BuildContext context) {
          context.push(Routes.authJunior);
        },
      ),
      _Item(
        status: kyc?.lv3Status ?? KycStatus.reject,
        precondition: kyc?.lv2Status == KycStatus.pass,
        withdrawLimit: conf.dailyWithdrawKycLv3,
        transferLimit: conf.dailyTransferKycLv3,
        title: "高级认证",
        requirement: "要求：1.手持身份证照片视频",
        onTap: (BuildContext context) {
          context.push(Routes.authSenior);
        },
      ),
    ];

    final index = <bool>[
      kyc?.lv1Status == KycStatus.pass,
      kyc?.lv2Status == KycStatus.pass,
      kyc?.lv3Status == KycStatus.pass,
    ].lastIndexWhere((element) => element == true);

    final level = items[index + 1];

    return Material(
      color: Colors.grey.shade50,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBasement(context, user, level),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length - 1,
              itemBuilder: (_, index) {
                return _buildCard(context, items[index + 1]);
              },
            )
          ],
        ),
      ),
    );
  }

  Card _buildBasement(BuildContext context, UserBaseModel user, _Item level) {
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
                  _buildKycStatus(context, level),
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
                  _buildItem("数字货币提币限额", "${level.withdrawLimit} USDT 每日", true),
                  _buildItem("法币充值&提现限额", "${level.transferLimit} USDT 每日", true),
                  _buildItem("C2C交易限额", "无限额", true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCard(BuildContext context, _Item item) {
    final enable = item.status == KycStatus.reject && item.precondition;
    final config = statusText[item.status.index];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: enable ? null : Colors.grey.shade100,
      child: ListTile(
        onTap: enable ? () => item.onTap(context) : null,
        isThreeLine: true,
        contentPadding: const EdgeInsets.only(left: 8),
        leading: SizedBox(
          width: 24,
          child: Checkbox(
            value: item.status == KycStatus.pass,
            onChanged: null,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              "提币限额 ${item.withdrawLimit} USDT 每日，平台转账限额 ${item.transferLimit} USDT 每日",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16)
          ],
        ),
        subtitle: Text(
          item.requirement,
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

  _buildItem(String label, String value, [bool? style]) {
    return Cell(
      height: 30,
      titleText: label,
      trailingText: value,
      trailingTextStyle: style == true ? Font.smallGrey : null,
    );
  }

  _buildKycStatus(BuildContext context, _Item level) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(level.title),
      backgroundColor: level.status == KycStatus.reject ? theme.disabledColor : theme.primaryColor,
      labelStyle: const TextStyle(color: Colors.white),
      side: const BorderSide(color: Colors.transparent),
      shape: const StadiumBorder(),
    );
  }
}

class _Item {
  final KycStatus status;
  final bool precondition;
  final Function onTap;
  final num withdrawLimit;
  final num transferLimit;
  final String title;
  final String requirement;

  const _Item({
    required this.status,
    required this.precondition,
    required this.onTap,
    required this.withdrawLimit,
    required this.transferLimit,
    required this.title,
    required this.requirement,
  });
}
