library ad_history;

import 'package:flutter/material.dart';
import 'package:otc/pages/ad/ad_own/ad_own.dart';

class AdHistory extends StatelessWidget {
  const AdHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdOwn(running: false);
  }
}
