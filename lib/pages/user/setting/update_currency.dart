import 'package:flutter/material.dart';
import 'package:otc/pages/components/user_modal_page_template/user_modal_page_template.dart';

class UpdateCurrency extends StatelessWidget {
  const UpdateCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return UserModalPageTemplate(
      legend: "个人资料",
      title: "货币单位",
      onCompelete: () {},
      children: [
        SwitchListTile.adaptive(
          dense: true,
          title: const Text("CNY-¥"),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          dense: true,
          title: const Text("USD-\$"),
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
