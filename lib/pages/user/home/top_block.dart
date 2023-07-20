import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/http/http.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/models/user_stats/user_stats.model.dart';
import 'package:otc/pages/user/home/indicator.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';

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
    final lastLoggedIp =
        ref.read(userStatsProvider.select((value) => value.lastLoggedIp));

    final securities = <bool>[
      user.emailValid,
      user.phoneValid,
      user.googleSecretValid
    ];
    final securityLevel =
        securities.where((element) => element).length / securities.length * 100;

    return Row(
      children: [
        Expanded(
          child: _buildBaseInfo(user, lastLoggedIp),
        ),
        SizedBox(
          width: 300,
          height: 220,
          child: Card(
            child: Column(
              children: [
                ListTile(
                  // isThreeLine: true,
                  title: const Text("安全等级"),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    context.goNamed(Routes.security);
                  },
                ),
                const Divider(
                  height: 2,
                ),
                Expanded(
                  child: Center(
                    child: Indicator(
                      value: securityLevel,
                      secondarColor: Colors.blue.shade100,
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
              title: Row(
                children: [
                  Text(
                    user.nickname,
                    style: Font.mediumBold,
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    iconSize: 18,
                    onPressed: () {},
                  )
                ],
              ),
              subtitle: Text(
                "用户ID：${user.username}",
                style: Font.smallGrey,
              ),
            ),
            const SizedBox(height: 24),
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
