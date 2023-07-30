library ad_post;

import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
part 'package:otc/pages/ad/ad_post/ad_post.next.dart';
part 'package:otc/pages/ad/ad_post/ad_post.prev.dart';
part './ad_post.range.dart';
part './ad_post.bank.template.dart';
part 'ad_post.payment.dart';

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
  final bool isNext = false;
  final Map<String, dynamic> formState = {};
  @override
  Widget build(BuildContext context) {
    return Form(
      child: isNext
          ? AdPostPrev(
              formState: formState,
              type: widget.type,
            )
          : AdPostNext(
              formState: formState,
              type: widget.type,
            ),
    );
  }
}
