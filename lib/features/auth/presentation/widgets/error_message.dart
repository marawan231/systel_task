import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systel_telecom_task/core/color_manager.dart';
import 'package:systel_telecom_task/core/values_manager.dart';
import 'package:systel_telecom_task/features/auth/business_logic/cubit/auth_cubit.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.errorText}) : super(key: key);

  final String errorText;

  Widget _buildLeadingIconButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.white,
          width: AppSize.s2,
        ),
        shape: BoxShape.circle,
      ),
      child: InkWell(
        child: const Icon(
          Icons.close,
          size: AppSize.s15,
          color: ColorManager.white,
        ),
        onTap: () {
          BlocProvider.of<AuthCubit>(context).hideErrorMessage();
        },
      ),
    );
  }

  Widget _buildErrorText(BuildContext context) {
    return Expanded(
      child: Text(
        errorText,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: AppSize.s14,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorManager.error,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
      height: MediaQuery.of(context).size.height * .055,
      width: MediaQuery.of(context).size.width * .6,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Row(
        children: [
          _buildLeadingIconButton(context),
          SizedBox(width: MediaQuery.of(context).size.width * .02),
          _buildErrorText(context),
        ],
      ),
    );
  }
}

