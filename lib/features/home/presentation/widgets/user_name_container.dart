import 'package:flutter/material.dart';
import 'package:systel_telecom_task/core/strings_manager.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({
    Key? key, required this.username,
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: AppStrings.goodEvening,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      TextSpan(
        text: username,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ]));
  }
}
