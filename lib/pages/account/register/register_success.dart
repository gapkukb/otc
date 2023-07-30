import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "恭喜您注册成功！",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // const SizedBox(height: 32),
          Text(
            "全国招商计划正在火热进行中，加入做市商联盟可以获得高额返佣。每笔成交的星级订单，可获得不低于 xx% 的返佣！！！",
            style: Theme.of(context).textTheme.labelLarge,
          ),

          Row(
            children: [
              Expanded(
                child: UiButton(
                  size: UiButtonSize.medium,
                  variant: UiButtonVariant.outline,
                  label: "先去逛逛",
                  onPressed: () {
                    Router.neglect(context, () {
                      context.goNamed(Routes.home);
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: UiButton(
                  size: UiButtonSize.medium,
                  label: "加入做市商联盟",
                  onPressed: () {
                    Router.neglect(context, () {
                      context.goNamed(Routes.home);
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
