import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';
import './register/register.dart';
import './login/login.dart';

class AccountType {
  static const register = "register";
  static const login = "login";
}

class Account extends StatelessWidget {
  final String? type;
  const Account({
    super.key,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final child = type == AccountType.login ? const Login() : const Register();

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: context.md
              ? const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/register.png"),
                    fit: BoxFit.fitHeight,
                    // opacity: 0.8,
                  ),
                )
              : null,
          child: SingleChildScrollView(
            child: context.md
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: child,
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
                              child: child,
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
