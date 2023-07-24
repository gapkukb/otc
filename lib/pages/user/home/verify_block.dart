import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/tip/tip.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';

class VerifyBlock extends StatelessWidget {
  const VerifyBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/WaveHeader.png"),
              ),
            ),
            child: ListTile(
              tileColor: Colors.transparent,
              title: Row(
                children: [
                  const Text(
                    "验证您的账户",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(Icons.help, color: Colors.white),
                    onTap: () {},
                  )
                ],
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "通过认证，获得更高交易额度",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 3,
                  ),
                ),
              ),
              trailing: UiButton(
                color: Colors.white,
                label: "去KYC认证",
                size: UiButtonSize.small,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff016452),
                ),
                onPressed: () {
                  context.go(Routes.auth);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
