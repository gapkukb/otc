import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class TransferCounter extends StatelessWidget {
  final Function() onSubmit;
  const TransferCounter({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("0.00 USDT 可用 ，2000 USDT 24小时提币额度"),
        const Gap.small(),
        Text(
          "到账金额：.71 USDT",
          style: Font.x2largeBold,
        ),
        const Gap.small(),
        UiButton(
          size: UiButtonSize.medium,
          minWidth: 300,
          onPressed: () {
            submit(context);
          },
          label: "提币",
        ),
      ],
    );
  }

  submit(BuildContext context) {
    // 提币异常1 - 额度不够
    Modal.alert(
      title: "提币提醒",
      content:
          "您的每日提币额度为2000.00 USDT\n当前可提币额度为0.00 USDT\n您可以升级更高级的身份认证来提升提币额度\n请明日再试",
      okButtonText: "知道了",
    );

    // 提币异常2 - 提币会有T+N的条件限制：
    /** 
    1.充值

    2.修改登录密码

    3.修改资金密码

    4.修改谷歌验证器

    5.修改邮箱

    6.修改手机

    以上条件都会触发提币限制，N小时后才能提币，已最后触发条件的时间为准
    */
    Modal.confirm(
      title: "提币提醒",
      widget: Text.rich(
        TextSpan(
          text: "您将在 179:03 后开启提币功能。\n如有疑问，",
          children: [
            TextSpan(
              text: "请联系客服",
              style: TextStyle(color: Theme.of(context).primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.goNamed(Routes.auth);
                },
            )
          ],
        ),
      ),
      okButtonText: "知道了",
    );

    onSubmit();
  }
}
