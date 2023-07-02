import 'package:flutter/material.dart';
import 'package:otc/pages/user/bindings/binding_phone_f2a.dart';
import 'package:otc/pages/user/bindings/binding_phone_update.dart';

class BindingPhone extends StatefulWidget {
  const BindingPhone({super.key});

  @override
  State<BindingPhone> createState() => _BindingPhoneState();
}

class _BindingPhoneState extends State<BindingPhone> {
  int _type = 0;

  onCompelete() {
    print('object');
    setState(() {
      _type = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _type == 0
        ? BindingPhoneF2A(
            onCompelete: onCompelete,
          )
        : const BindingPhoneUpdate();
  }
}
