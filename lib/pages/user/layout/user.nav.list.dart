import 'package:go_router/go_router.dart';
import 'package:otc/router/router.dart';

enum UserNavList {
  c2c("C2C用户中心", Routes.c2c),
  rebate("返佣", Routes.rebate),
  tasks("任务中心", Routes.tasks),
  security("账户安全", Routes.security),
  auth("身份认证", Routes.auth),
  merchant("做市商认证", Routes.merchant),
  setting("设置", Routes.setting);

  const UserNavList(this.label, this.pathname);

  final String label;
  final String pathname;

  go() {
    GoRouter.of(navigatorKey.currentContext!).go(pathname);
  }
}
