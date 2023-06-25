import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/components/modal/modal.dart';
import 'package:otc/pages/components/panel/panel.dart';
import 'package:otc/pages/user/setting/update_currency.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Panel(
              title: "个人资料",
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    _buildNickName(),
                    const SizedBox(height: 16),
                    _buildAvatar(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Panel(
              title: "个人资料",
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    _buildNotification(),
                    const SizedBox(height: 16),
                    _buildCurrency(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildNickName() {
    return ListTile(
      title: const Text(
        "昵称",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: const Text(
          "为您的个人资料设置自定义昵称。",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "我是狗鸡",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          TextButton(
            child: const Text(
              "编辑",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onPressed: () {
              context.push('/setting_nickname');
            },
          )
        ],
      ),
    );
  }

  _buildAvatar() {
    return ListTile(
      title: const Text(
        "头像",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: const Text(
          "请选择一个头像以个性化您的帐户。",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            child: FlutterLogo(),
          ),
          TextButton(
            child: const Text(
              "修改",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            onPressed: () {
              context.push('/update_avatar');
            },
          )
        ],
      ),
    );
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

  bool enable = false;

  _buildNotification() {
    return ListTile(
      title: const Text(
        "通知",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: const Text(
          "一旦启用，您将在app和网站内收到相关通知。",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      trailing: Switch(
        value: enable,
        thumbIcon: thumbIcon,
        onChanged: (value) {
          setState(() {
            enable = !enable;
            Modal.alert(
              title: enable ? "开启通知" : "关闭通知",
              content: enable ? "已开启通知，您将在网站内收到相关通知。" : "已关闭通知，您将停止接收到网站内相关通知。",
            );
          });
        },
      ),
    );
  }

  _buildCurrency() {
    return ListTile(
      title: const Text(
        "货币单位",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: const Text(
          "网站显示数字货币的计量单位。",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      trailing: Switch(
        value: enable,
        thumbIcon: thumbIcon,
        onChanged: (value) {
          setState(() {
            enable = !enable;
            showDialog(
              context: context,
              builder: (context) {
                return const UpdateCurrency();
              },
            );
          });
        },
      ),
    );
  }
}
