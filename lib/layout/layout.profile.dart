import 'package:flutter/material.dart';

class LayoutProfile extends StatefulWidget {
  final String userName;

  const LayoutProfile({
    super.key,
    required this.userName,
  });

  @override
  State<LayoutProfile> createState() => _LayoutProfileState();
}

class _LayoutProfileState extends State<LayoutProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: const StadiumBorder(),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: CircleAvatar(
              foregroundImage: AssetImage(
                'assets/images/efc12c8f9b0b13c844c7d6086dc4d1d5.jpg',
              ),
            ),
          ),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 60),
            child: Text(
              widget.userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down_outlined)
        ],
      ),
      onPressed: () {},
    );
  }
}
