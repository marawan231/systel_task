import 'package:flutter/material.dart';
import 'package:systel_telecom_task/core/constants.dart';
import 'package:systel_telecom_task/core/font_manager.dart';
import 'package:systel_telecom_task/core/strings_manager.dart';
import 'package:systel_telecom_task/core/values_manager.dart';
import 'package:systel_telecom_task/features/auth/data/model/user.dart';
import '../../../../core/color_manager.dart';

class UserItemContainer extends StatelessWidget {
  const UserItemContainer({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  Widget _buildTitleContainer(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
            color: ColorManager.darkGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s10),
                topRight: Radius.circular(AppSize.s10))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildUserNameText(context),
              _buildWalletMoneyText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserNameText(BuildContext context) {
    return FittedBox(
      child: Text(
        user.userName!,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildWalletMoneyText(BuildContext context) {
    return Text(
      user.walletAmount!,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeightManager.regular,
            fontSize: 10,
          ),
    );
  }

  Widget _buildUserInfoContainer(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.s10),
            bottomRight: Radius.circular(AppSize.s10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMoneyAmount(context),
            _buildLastUpdated(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMoneyAmount(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCurrencyText(context),
          _buildAmount(context),
        ],
      ),
    );
  }

  Widget _buildCurrencyText(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Text(
        AppStrings.egp,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildAmount(BuildContext context) {
    return Text(
      user.walletAmount!,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: AppSize.s30,
          ),
    );
  }

  Widget _buildLastUpdated(BuildContext context) {
    return Text(
      "${AppStrings.lastSpend} ${user.lastUpdate!}",
      style: Theme.of(context).textTheme.bodySmall!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .45,
      width: MediaQuery.of(context).size.width * .32,
      child: Column(children: [
        _buildTitleContainer(context),
        _buildUserInfoContainer(context),
      ]),
    );
  }
}
