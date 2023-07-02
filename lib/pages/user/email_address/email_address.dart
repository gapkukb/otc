import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/email_address/email_address_next.dart';
import 'package:otc/pages/user/email_address/email_address_prev.dart';

class UserEmailAddress extends StatefulWidget {
  const UserEmailAddress({super.key});

  @override
  State<UserEmailAddress> createState() => _UserEmailAddressState();
}

class _UserEmailAddressState extends State<UserEmailAddress> {
  bool isNext = false;

  @override
  Widget build(BuildContext context) {
    return isNext
        ? const UserEmailAddressNext()
        : UserEmailAddressPrev(
            onCompelete: () {
              setState(() {
                isNext = true;
              });
            },
          );
  }
}
