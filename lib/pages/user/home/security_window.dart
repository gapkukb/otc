import 'package:flutter/material.dart';

class SecurityWindow extends StatelessWidget {
  const SecurityWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridView.count(
        crossAxisCount: 4,
        children: [
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
        ],
      ),
    );
  }
}
