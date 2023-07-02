import 'package:flutter/material.dart';

class LayoutBottomNavigation extends StatefulWidget {
  const LayoutBottomNavigation({Key? key}) : super(key: key);

  @override
  State<LayoutBottomNavigation> createState() => _LayoutBottomNavigationState();
}

class _LayoutBottomNavigationState extends State<LayoutBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('layout bottom navigation'),
      ),
      body: Container(),
    );
  }
}
