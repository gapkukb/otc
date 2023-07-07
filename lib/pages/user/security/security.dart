import 'package:flutter/material.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/widgets/ui_button.dart';

class UserSecurity extends StatefulWidget {
  const UserSecurity({super.key});

  @override
  State<UserSecurity> createState() => _UserSecurityState();
}

class _UserSecurityState extends State<UserSecurity> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const UserTopBlock(),
          _buildAuthrization(),
          _buildSecurityManagement(),
        ],
      ),
    );
  }

  Panel _buildSecurityManagement() => Panel(
        title: "安全管理",
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return _buildAuthrizationItem();
            },
          ),
        ),
      );

  Panel _buildAuthrization() => Panel(
        title: "身份验证",
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return _buildAuthrizationItem();
            },
          ),
        ),
      );

  ListTile _buildAuthrizationItem() {
    return ListTile(
      tileColor: Colors.grey.shade100,
      title: Text("邮箱"),
      subtitle: Text("用于登录、提现和修改安全设置"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("g****j@gmail.com"),
          UiButton(
            variant: UiButtonVariant.text,
            label: "修改",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
