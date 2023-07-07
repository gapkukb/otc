import 'package:flutter/material.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';

class UpdateCurrency extends StatelessWidget {
  const UpdateCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
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
