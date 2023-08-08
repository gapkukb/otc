import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/providers/otc.provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';

class RebateBanner extends ConsumerWidget {
  const RebateBanner({super.key});

  @override
  Widget build(context, ref) {
    final otc = ref.read(otcProvider);
    final user = ref.read(userBaseProvider);
    return Card(
      child: Container(
        height: 387,
        padding: const EdgeInsets.only(left: 64.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: Assets.images.rebate.provider(),
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "加入Maoerduo做市商联盟，可获得",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "挂单成交额度${otc.lowestCommission}%的佣金",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.red),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                if (user.makerState == null || user.makerState == Audit.REJECT)
                  UiButton(
                    size: UiButtonSize.medium,
                    color: Colors.black,
                    label: "立即加入",
                    onPressed: () {
                      context.go(Routes.merchant);
                    },
                  ),
                const SizedBox(width: 24),
                UiButton(
                  size: UiButtonSize.medium,
                  color: Colors.white,
                  label: "邀请好友",
                  onPressed: () {
                    if (ref.read(kycAuthProvider)) {
                      context.go(Routes.merchant);
                    } else {
                      Modal.confirm(
                        title: "商户申请",
                        content: "您需要先完成初级或以上身份认证才可以使用",
                        okButtonText: "去认证",
                        onOk: () {
                          context.go(Routes.auth);
                        },
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
