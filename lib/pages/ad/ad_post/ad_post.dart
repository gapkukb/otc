library ad_post;

import 'dart:math' as math;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/amount_input/amount_input.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/components/tip/tip.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/http/http.dart';
import 'package:otc/models/wallet.bank/wallet.bank.model.dart';
import 'package:otc/models/wallet.qrcode/wallet.qrcode.model.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/providers/lowest_limit.provider.dart';
import 'package:otc/providers/otc.provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:otc/widgets/ui_number_stepper.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
part 'package:otc/pages/ad/ad_post/ad_post.next.dart';
part 'package:otc/pages/ad/ad_post/ad_post.prev.dart';
part './ad_post.range.dart';
part 'ad_post.payment.template.dart';
part 'ad_post.payment.dart';
part 'ad_post.provider.dart';
part 'ad_post.submit.dart';

enum AdPostType {
  buying,
  selling,
}

class AdPost extends StatefulWidget {
  final AdPostType type;
  const AdPost({
    super.key,
    this.type = AdPostType.buying,
  });

  @override
  State<AdPost> createState() => _AdPostState();
}

class _AdPostState extends State<AdPost> with SingleTickerProviderStateMixin {
  bool isNext = false;
  // 暂时只支持 usdt 和 cny 这里先写死
  final Map<String, dynamic> formState = {
    "coin": Cryptocurrency.USDT.name,
    "money": Fiatcurrency.CNY.name,
  };
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: !isNext
          ? AdPostPrev(
              formState: formState,
              type: widget.type,
              onCompelete: _onCompelete,
            )
          : AdPostNext(
              formState: formState,
              formKey: formKey,
              type: formState["sell"] == true ? AdPostType.selling : AdPostType.buying,
            ),
    );
  }

  _onCompelete(bool isBuying) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      formState.update(
        "sell",
        (value) => !isBuying,
        ifAbsent: () => !isBuying,
      );
      setState(() {
        isNext = true;
      });
    }
  }
}
