import 'package:flutter/material.dart';
import 'package:systel_telecom_task/core/values_manager.dart';

import '../../../../core/color_manager.dart';

class CustomLargeButton extends StatelessWidget {
  const CustomLargeButton({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(AppMargin.m0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s10),
          ),
        ),
        color: ColorManager.lightPurple,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .12,
          child: ListTile(
            trailing: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .03,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.white,
                size: AppSize.s20,
              ),
            ),
            title: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
