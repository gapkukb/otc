import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/providers/otc.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';

class RegisterSuccess extends ConsumerWidget {
  final double rate;
  const RegisterSuccess({
    super.key,
    required this.rate,
  });

  @override
  Widget build(context, ref) {
    final otc = ref.watch(otcProvider);

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
            "全国招商计划正在火热进行中，加入做市商联盟可以获得高额返佣。每笔成交的星级订单，可获得不低于${otc.lowestCommission}% 的返佣！！！",
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
                      context.go(Routes.home);
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
                      context.go(Routes.merchant);
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
