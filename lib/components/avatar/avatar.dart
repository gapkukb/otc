import 'package:flutter/material.dart';
import 'package:otc/constants/base_url.dart';

class Avatar extends CircleAvatar {
  final String? avatar;
  Avatar({
    super.key,
    this.avatar,
    super.backgroundImage,
    super.foregroundColor,
    super.maxRadius,
    super.minRadius,
    super.onBackgroundImageError,
    super.onForegroundImageError,
    super.radius,
  }) : super(
          backgroundColor: Colors.grey.withOpacity(0.2),
          foregroundImage: (avatar == null || avatar.isEmpty) ? null : NetworkImage("$fileUrl/$avatar"),
          child: (avatar == null || avatar.isEmpty) ? const Icon(Icons.account_circle_outlined) : null,
        );
}
