import 'package:flutter/material.dart';
import 'package:otc/components/qrcode_image_parser/qrcode_image_parser.dart';
import 'package:otc/components/upload/upload.dart';
import 'dart:html' as html;

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  final controller = UploadController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrcodeImageParser(
          child: Upload(controller: controller),
        ),
        FilledButton(
          onPressed: () async {
            final code = await QrcodeImageParser.parse(controller.items.first.path);
            print(code);
          },
          child: Text("测试"),
        )
      ],
    );
  }
}
