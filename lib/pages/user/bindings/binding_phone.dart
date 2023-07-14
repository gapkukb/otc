import 'package:flutter/material.dart';
import 'package:otc/pages/user/f2a/f2a.bind.dart';
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
        ? F2ABind(
            // onCompelete: onCompelete,
            )
        : const BindingPhoneUpdate();
  }
}
