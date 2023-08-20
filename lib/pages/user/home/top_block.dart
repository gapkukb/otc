import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/pages/user/home/indicator.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_clipboard.dart';

class UserTopBlock extends ConsumerStatefulWidget {
  const UserTopBlock({super.key});

  @override
  ConsumerState<UserTopBlock> createState() => _UserTopBlockState();
}

class _UserTopBlockState extends ConsumerState<UserTopBlock> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    final user = ref.read(userBaseProvider);
    final lastLoggedIp = ref.read(userStatsProvider.select((value) => value.lastLoggedIp));

    final securities = <bool>[
      user.emailValid,
      user.phoneValid,
      user.googleSecretValid,
    ];
    final securityLevel = securities.where((element) => element).length / securities.length * 100;

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildBaseInfo(user, lastLoggedIp),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 300,
            height: 228,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: Pads.sm,
                    child: Text(
                      "安全等级",
                      style: Font.medium,
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  Expanded(
                    child: Center(
                      child: Indicator(
                        value: securityLevel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Card _buildBaseInfo(UserBaseModel user, String lastLoggedIp) {
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
              leading: Avatar(
                avatar: user.avatar,
                radius: 72 / 2,
              ),
              title: Text(
                user.nickname,
                style: Font.mediumBold,
              ),
              subtitle: UiClipboard(
                text: user.username,
                iconSize: 14,
                child: Text(
                  "用户ID：${user.username}",
                  style: Font.smallGrey,
                ),
              ),
            ),
            Text(
              "上次登录时间\u0020\u0020\u0020\u0020IP: $lastLoggedIp",
              style: Font.smallGrey,
            ),
            const SizedBox(height: 16),
            Text(
              "账户创建时间：${user.createdTime}\u0020\u0020\u0020\u0020IP: ${user.regIp}",
              style: Font.smallGrey,
            ),
          ],
        ),
      ),
    );
  }
}
