import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/pages/user/sidebar.data.dart';
import 'package:otc/providers/auth.provider.dart';
import 'package:otc/providers/user.provider.dart';
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

      menuChildren: userNavsList.map((item) {
        return MenuItemButton(
          style: MenuItemButton.styleFrom(
            fixedSize: const Size.fromWidth(180.0),
          ),
          child: Text(
            item['label'],
            style: Font.small,
          ),
          onPressed: () {
            context.go(item['path']);
          },
        );
      }).toList()
        ..add(MenuItemButton(
          style: MenuItemButton.styleFrom(
            fixedSize: const Size.fromWidth(180.0),
          ),
          child: const Text("注销", style: Font.small),
          onPressed: () {
            ref.read(userProvider.notifier).logout();
            ref.read(authProvider.notifier).update((state) => false);
          },
        )),
      builder: (context, controller, child) {
        final avatar = ref.watch(userProvider.select((value) => value.avatar));
        return MaterialButton(
          height: 40,
          shape: const StadiumBorder(),
          child: Row(
            children: [
              SizedBox(width: 32, child: Avatar(avatar: avatar)),
              const SizedBox(width: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 60),
                child: Text(
                  ref.watch(userProvider.select((value) => value.nickname)),
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
