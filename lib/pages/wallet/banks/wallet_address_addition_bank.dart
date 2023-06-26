import 'package:flutter/material.dart';

class WalletAddressAdditionBank extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  WalletAddressAdditionBank({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            maxLength: 10,
            decoration: const InputDecoration(
              label: Text("姓名"),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          TextFormField(
            maxLength: 10,
            decoration: const InputDecoration(
              label: Text("银行卡号"),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "银行卡号不能为空";
            },
          ),
          TextFormField(
            maxLength: 10,
            decoration: const InputDecoration(
              label: Text("银行名称"),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "银行名称不能为空";
            },
          ),
          TextFormField(
            maxLength: 10,
            decoration: const InputDecoration(
              label: Text("开户支行（选填）"),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xfff5f5f5),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Icon(Icons.error),
                    SizedBox(width: 8),
                    Text("特别提示"),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "秘钥可用于找回谷歌验证器，请勿透露给他人并妥善备份保存",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
