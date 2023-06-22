import 'package:flutter/material.dart';

class UserBottomNarbar extends StatelessWidget {
  const UserBottomNarbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: '123',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: '123',
        ),
      ],
    );
  }
}
