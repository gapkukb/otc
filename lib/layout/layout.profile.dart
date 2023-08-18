import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/avatar/avatar.dart';
import 'package:otc/components/menu/menu.dart';
import 'package:otc/pages/user/layout/user.nav.list.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';

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
    final userBase = ref.watch(userBaseProvider);
    final nickname = ref.watch(userProvider.select((value) => userBase.nickname));
    return Menu(
      onSelected: (value) async {
        if (value == "logout") {
          context.go(Routes.home);
          ref.read(userProvider.notifier).logout();
        } else {
          context.go(value);
        }
      },
      items: UserNavList.values.map((item) {
        return MenuItem(
          title: item.label,
          value: item.pathname,
        );
      }).toList()
        ..add(const MenuItem(
          title: "退出",
          value: "logout",
        )),
      child: MaterialButton(
        mouseCursor: SystemMouseCursors.click,
        shape: const StadiumBorder(),
        onPressed: null,
        child: Row(
          children: [
            SizedBox(width: 32, child: Avatar(avatar: userBase.avatar)),
            const SizedBox(width: 8),
            Text(
              nickname,
              maxLines: 1,
              // overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff252F40),
                // fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.keyboard_arrow_down_outlined)
          ],
        ),
      ),
    );
  }
}
