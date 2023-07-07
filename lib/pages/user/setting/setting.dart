import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/pages/user/setting/update_currency.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
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

  static const titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  ListTile _buildItem({
    required String title,
    required String subtitle,
    required List<Widget> trailing,
  }) {
    return ListTile(
      tileColor: Colors.grey.shade100,
      title: Text(title, style: titleStyle),
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
      const Text(
        "我是狗鸡",
        style: TextStyle(
          fontSize: 14,
        ),
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
      const CircleAvatar(
        child: FlutterLogo(),
      ),
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
