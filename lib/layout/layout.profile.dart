import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/pages/user/layout/user.nav.list.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';

class LayoutProfile extends ConsumerStatefulWidget {
  final String userName;

  const LayoutProfile({
    super.key,
    required this.userName,
  });

  @override
  ConsumerState<LayoutProfile> createState() => _LayoutProfileState();
}

class _LayoutProfileState extends ConsumerState<LayoutProfile> {
  @override
  Widget build(context) {
    return MenuAnchor(
      // alignmentOffset: const Offset(10, 10),
      style: const MenuStyle(
        alignment: Alignment.bottomRight,
      ),

      menuChildren: UserNavList.values.map((item) {
        return MenuItemButton(
          style: MenuItemButton.styleFrom(
            fixedSize: const Size.fromWidth(180.0),
          ),
          onPressed: item.go,
          child: Text(
            item.label,
            style: Font.small,
          ),
        );
      }).toList()
        ..add(MenuItemButton(
          style: MenuItemButton.styleFrom(
            fixedSize: const Size.fromWidth(180.0),
          ),
          child: const Text("注销", style: Font.small),
          onPressed: () {
            ref.read(userProvider.notifier).logout();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.home, (route) => false);
          },
        )),
      builder: (context, controller, child) {
        final userBase = ref.watch(userBaseProvider);
        return MaterialButton(
          height: 40,
          shape: const StadiumBorder(),
          child: Row(
            children: [
              SizedBox(width: 32, child: Avatar(avatar: userBase.avatar)),
              const SizedBox(width: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 60),
                child: Text(
                  ref.watch(userProvider.select((value) => userBase.nickname)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
        );
      },
    );
  }
}
