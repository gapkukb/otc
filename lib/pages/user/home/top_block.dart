import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/http/http.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/pages/user/home/indicator.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/theme/text_theme.dart';

class UserTopBlock extends ConsumerStatefulWidget {
  const UserTopBlock({super.key});

  @override
  ConsumerState<UserTopBlock> createState() => _UserTopBlockState();
}

class _UserTopBlockState extends ConsumerState<UserTopBlock> {
  String latestLoginIp = "";
  @override
  void initState() {
    super.initState();
    apis.user.getUserLog(null, HttpOptions(pathParams: {"num": "1"})).then(
          (value) => setState(
            () => latestLoginIp = value,
          ),
        );
  }

  @override
  Widget build(context) {
    final user = ref.read(userProvider);
    return Row(
      children: [
        Expanded(
          child: _buildBaseInfo(user),
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

  Card _buildBaseInfo(UserModel user) {
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
              "上次登录时间\u0020\u0020\u0020\u0020IP: $latestLoginIp",
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
