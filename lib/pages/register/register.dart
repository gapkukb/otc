import 'package:flutter/material.dart';
import 'package:otc/pages/register/register_account.dart';
import 'package:otc/utils/responsive.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/register.png"),
              fit: BoxFit.cover,
              // opacity: 0.8,
            ),
          ),
          child: SingleChildScrollView(
            child: context.md
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: RegisterAccount(),
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
                              child: const RegisterAccount(),
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
