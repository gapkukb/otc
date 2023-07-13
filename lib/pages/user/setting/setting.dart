import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/pages/user/setting/update_currency.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/theme/text_theme.dart';

class UserSetting extends ConsumerStatefulWidget {
  const UserSetting({super.key});

  @override
  ConsumerState<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends ConsumerState<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Panel(
            title: "个人资料",
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  _buildNickName(),
                  const SizedBox(height: 16),
                  _buildAvatar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildItem({
    required String title,
    required String subtitle,
    required List<Widget> trailing,
  }) {
    return ListTile(
      tileColor: Colors.grey.shade100,
      title: Text(title, style: Font.largeBold),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(subtitle),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: trailing,
      ),
    );
  }

  _buildNickName() {
    return _buildItem(title: "昵称", subtitle: "为您的个人资料设置自定义昵称。", trailing: [
      Text(
        ref.watch(userProvider.select((value) => value.nickname)),
        style: Font.small,
      ),
      TextButton(
        child: const Text("编辑"),
        onPressed: () {
          context.push('/setting_nickname');
        },
      ),
    ]);
  }

  _buildAvatar() {
    return _buildItem(title: "头像", subtitle: "请选择一个头像以个性化您的帐户。", trailing: [
      Avatar(avatar: ref.watch(userProvider.select((value) => value.avatar))),
      TextButton(
        child: const Text("修改"),
        onPressed: () {
          context.push('/setting_avatar');
        },
      )
    ]);
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
}
