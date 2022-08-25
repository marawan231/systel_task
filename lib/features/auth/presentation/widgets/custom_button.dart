import 'package:flutter/material.dart';
import 'package:systel_telecom_task/core/values_manager.dart';
import 'package:systel_telecom_task/features/auth/presentation/widgets/default_container.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: AppSize.s14,
            color: ColorManager.white,
            fontFamily: FontConstants.defaultFontFamily,
          ),
        ),
      ),
    );
  }
}
