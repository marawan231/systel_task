import 'package:flutter/material.dart';
import 'package:systel_telecom_task/core/strings_manager.dart';
import '../../../../core/color_manager.dart';
import '../../../../core/values_manager.dart';

class UserInformationItem extends StatelessWidget {
  const UserInformationItem(
      {Key? key,
      required this.title,
      required this.imageIcon,
      required this.moneyAmount,
      required this.lastUpdated})
      : super(key: key);

  final String title;
  final String imageIcon;
  final String moneyAmount;
  final String lastUpdated;

  Widget _buildTitleContainer(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoContainer(BuildContext context) {
    return Expanded(
      flex: 3,
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
            _buildIcon(),
            _buildMoneyAmount(context),
            _buildLastUpdated(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Image.asset(imageIcon);
  }

  Widget _buildMoneyAmount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCurrencyText(context),
        _buildAmount(context),
      ],
    );
  }

  Widget _buildCurrencyText(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        AppStrings.egp,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildAmount(BuildContext context) {
    return Text(
      moneyAmount,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Widget _buildLastUpdated(BuildContext context) {
    return Text(
      lastUpdated,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .4,
      width: MediaQuery.of(context).size.width * .4,
      child: Column(children: [
        _buildTitleContainer(context),
        _buildUserInfoContainer(context),
      ]),
    );
  }
}
