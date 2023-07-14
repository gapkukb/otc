import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/pages/user/email/email.bind.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/navigator.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_button.dart';

class UserSecurity extends ConsumerWidget {
  const UserSecurity({super.key});

  @override
  Widget build(context, ref) {
    final user = ref.watch(userProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const UserTopBlock(),
          _buildAuthrization(context, user),
          _buildSecurityManagement(context, user),
        ],
      ),
    );
  }

  Panel _buildSecurityManagement(BuildContext context, UserModel user) {
    final List<_Item> items = [
      _Item(
        typeId: 0,
        name: "登录密码",
        value: "",
        description: "用于保护账户安全",
        action: UiButton(
          variant: UiButtonVariant.text,
          size: UiButtonSize.mini,
          label: "修改",
          onPressed: () {
            context.pushNamed(Routes.udpatePwd);
          },
        ),
      ),
      _Item(
        typeId: 1,
        name: "资金密码",
        value: "未开启",
        description: "用于保护账户安全",
        action: UiButton(
          variant: UiButtonVariant.text,
          label: "绑定",
          onPressed: () {},
        ),
      ),
    ];
    return Panel(
      title: "安全管理",
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return _buildAuthrizationItem(items[index]);
          },
        ),
      ),
    );
  }

  Panel _buildAuthrization(BuildContext context, UserModel user) {
    final List<_Item> items = [
      _Item(
        typeId: 0,
        name: "邮箱",
        value: maskEmail(user.email),
        description: "用于登录、提现和修改安全设置",
        action: UiButton(
          variant: UiButtonVariant.text,
          label: user.emailValid ? "修改" : "绑定",
          onPressed: () async {
            if (user.emailValid) {
              context.pushNamed(Routes.updateEmail);
            } else {
              bindEmail(context, user);
            }
          },
        ),
      ),
      _Item(
        typeId: 1,
        name: "手机",
        value: maskPhoneNumber(user.phone),
        description: "用于登录、提现和修改安全设置",
        action: UiButton(
          variant: UiButtonVariant.text,
          label: "绑定",
          onPressed: () {},
        ),
      ),
      _Item(
        typeId: 2,
        name: "谷歌验证器",
        value: "",
        description: "用于登录、提现和修改安全设置",
        action: UiButton(
          variant: UiButtonVariant.text,
          label: user.googleSecretValid ? "修改" : "绑定",
          onPressed: () async {
            final result = await openCaptchaView(
              context: context,
              device: user.phoneValid
                  ? CaptchaDeviceType.phone
                  : CaptchaDeviceType.email,
              service: CaptchaServiceType.addF2A,
              switchable: user.phoneValid && user.emailValid,
            );
            if (result != null) {
              final String code = await apis.user.validateF2A({
                "device": result["device"],
                "captcha": result["code"],
              });
              await context.pushNamed(Routes.f2a, extra: code);
            }
          },
        ),
      ),
    ];
    return Panel(
      title: "身份验证",
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return _buildAuthrizationItem(items[index]);
          },
        ),
      ),
    );
  }

  ListTile _buildAuthrizationItem(_Item item) {
    return ListTile(
      tileColor: Colors.grey.shade100,
      title: Text(item.name),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          item.description,
          style: Font.miniGrey,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.value ?? ""),
          item.action,
        ],
      ),
    );
  }
}

class _Item {
  final int typeId;
  final String name;
  final String? value;
  final String description;
  final Widget action;

  _Item({
    required this.typeId,
    required this.name,
    required this.value,
    required this.description,
    required this.action,
  });
}
