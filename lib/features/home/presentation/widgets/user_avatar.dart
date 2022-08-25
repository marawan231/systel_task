import 'package:flutter/material.dart';
import 'package:systel_telecom_task/core/assets_manager.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.radius}) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Image.asset(
        ImageAssets.avatar,
        fit: BoxFit.cover,
      ),
    );
  }
}
