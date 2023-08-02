import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_flex.dart';

class Merchant extends ConsumerWidget {
  const Merchant({super.key});

  List<String> get items {
    return [
      "• 完成手机号或邮箱绑定",
      "• 账户余额不低于500 USDT",
      "• 完成身份验证",
      "• 绑定一张银行卡",
    ];
  }

  List<_Item> get futures {
    return [
      _Item(
        "广告发布权限",
        "广告方可以自由发布广告，买卖更灵活，更便捷。",
        Assets.images.image1.image(),
      ),
      _Item(
        "佣金收益",
        "为了让商家更好的服务用户，每完成一笔星级订单，商家都会获得一次返佣奖励。",
        Assets.images.image2.image(),
      ),
      _Item(
        "一对一服务",
        "我们针对商户提供一对一服务，提高交易效率。",
        Assets.images.image3.image(),
      )
    ];
  }

  @override
  Widget build(BuildContext context, ref) {
    return Material(
      color: Colors.grey.shade50,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 56),
            const Text(
              "认证商户申请",
              textAlign: TextAlign.center,
              style: Font.x4largeBold,
            ),
            const SizedBox(height: 8),
            const Text(
              "成为Maoerduo认证商户，获得广告发布权限，享受更多交易特权",
              textAlign: TextAlign.center,
              style: Font.largeGrey,
            ),
            const SizedBox(height: 32),
            applyButton(context, ref),
            const MaterialButton(
              onPressed: null,
              disabledColor: Colors.orange,
              disabledTextColor: Colors.white,
              child: Text("审核中"),
            ),
            const MaterialButton(
              onPressed: null,
              disabledColor: Colors.green,
              disabledTextColor: Colors.white,
              child: Text("已认证"),
            ),
            const SizedBox(height: 48),
            const Panel(
              title: "欢迎加入Maoerduo商户联盟",
              child: Padding(
                padding: Pads.md,
                child: Text("您可以享受到以下服务。"),
              ),
            ),
            const Panel(
              title: "信息上传成功",
              child: Padding(
                padding: Pads.md,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("平台会在48小时内审核完毕"),
                    Text("审核通过后，您将获得以下权益！"),
                  ],
                ),
              ),
            ),
            Panel(
              title: "申请条件",
              child: Padding(
                padding: Pads.md,
                child: Wrap(
                  children: items
                      .map(
                        (e) => FractionallySizedBox(
                          widthFactor: context.responsive(1, md: 0.5),
                          child: Padding(
                            padding: Pads.xs,
                            child: Text(
                              e,
                              style: Font.mediumBold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            UiFlex(
              children: futures.map((item) {
                return Card(
                  child: Padding(
                    padding: Pads.lg,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        item.image,
                        Text(
                          item.title,
                          style: Font.x2largeBold,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          item.description,
                          style: Font.miniGrey,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget applyButton(BuildContext context, WidgetRef ref) {
    return UiButton(
      label: "立即申请",
      size: UiButtonSize.medium,
      onPressed: () async {
        final kyc = ref.read(kycProvider);
        final balance = ref.read(balanceProvider);
        if (balance.balance < 500) {
          Modal.confirm(
            title: "商户申请",
            content: "您的账户余额不足500 USDT，请先充值。",
            okButtonText: "充币",
            onOk: () {
              context.go(Routes.recharge);
            },
          );
        } else if (kyc?.lv1Status == null) {
          Modal.confirm(
            title: "商户申请",
            content: "您需要先完成初级或以上身份认证，请先认证",
            okButtonText: "去认证",
            onOk: () {
              context.go(Routes.auth);
            },
          );
        } else if ((await apis.wallet.getAllBankCards()).isEmpty) {
          Modal.confirm(
            title: "商户申请",
            content: "请至少先绑定一张银行卡，银行卡户主姓名必须和身份证一致。",
            okButtonText: "去绑卡",
            onOk: () {
              context.go(Routes.walletMethod);
            },
          );
        } else {
          await apis.user.applyMaker();
        }
      },
    );
  }
}

class _Item {
  const _Item(
    this.title,
    this.description,
    this.image,
  );
  final String title;
  final String description;
  final Image image;
}
