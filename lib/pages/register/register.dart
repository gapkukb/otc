import 'package:flutter/material.dart';
import 'package:otc/pages/register/register_form.dart';
import 'package:otc/utils/responsive.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: context.md
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: RegisterForm(),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Image.asset(
                                "assets/images/register.png",
                              ),
                            ),
                            Container(
                              width: 518,
                              alignment: Alignment.center,
                              child: const RegisterForm(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      bottomNavigationBar: const Text(
        "版权所有©2022 mybit.com。保留所有权利",
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff333333),
        ),
      ),
    );
  }
}
