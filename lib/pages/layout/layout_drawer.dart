import 'package:flutter/material.dart';

class LayoutDrawer extends StatefulWidget {
  const LayoutDrawer({super.key});

  @override
  State<LayoutDrawer> createState() => _LayoutDrawerState();
}

class _LayoutDrawerState extends State<LayoutDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('drawer'),
      ),
      body: Container(),
    );
  }
}
