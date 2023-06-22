import 'package:flutter/material.dart';
import 'package:otc/pages/register/register_main.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: RegisterMain(),
        ),
        Text(
          "版权所有©2022 mybit.com。保留所有权利",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff333333),
          ),
        ),
      ],
    );
  }
}
