// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systel_telecom_task/core/color_manager.dart';
import 'package:systel_telecom_task/core/strings_manager.dart';
import 'package:systel_telecom_task/core/values_manager.dart';
import 'package:systel_telecom_task/db/users_database.dart';
import 'package:systel_telecom_task/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:systel_telecom_task/features/home/presentation/widgets/home_background_image.dart';
import 'package:systel_telecom_task/features/home/presentation/widgets/user_avatar.dart';
import 'package:systel_telecom_task/features/home/presentation/widgets/user_name_container.dart';
import '../../../../core/assets_manager.dart';
import '../../../../core/utils.dart';
import '../widgets/custom_large_button.dart';
import '../widgets/user_information_item.dart';
import '../widgets/user_item.dart';

class HomeView extends StatefulWidget {
  final currentUser;
  const HomeView({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  _buildHomeBloc() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AddedUser) {
          refreshUsers();
        }
      },
      builder: (context, state) {
        return _buildHomeViewBody(context);
      },
    );
  }

  _buildHomeViewBody(BuildContext context) {
    return Stack(
      children: [
        _buildBackGroundImage(),
        _buildMainUserView(context),
      ],
    );
  }

  Widget _buildBackGroundImage() {
    return const HomeBackgroundImage();
  }

  Widget _buildMainUserView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * .07,
        left: MediaQuery.of(context).size.width * .07,
        bottom: MediaQuery.of(context).size.height * .05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTopSection(context),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildUserNameSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserNameSection(BuildContext context) {
    return Row(
      children: [
        _buildCircleAvatar(),
        SizedBox(width: MediaQuery.of(context).size.width * .05),
        UserNameText(username: widget.currentUser.username!),
      ],
    );
  }

  Widget _buildCircleAvatar() {
    return const UserAvatar(
      radius: AppSize.s35,
    );
  }

  _buildBottomSection(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTransectionsSection(context),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          _buildTestButton(context),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          _buildAddUserSection(context),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          _buildUsersList(context)
        ],
      ),
    );
  }

  Widget _buildTransectionsSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildUserWalletInformations(context),
        SizedBox(
          width: MediaQuery.of(context).size.width * .03,
        ),
        _buildUserLastActivityInformations(context),
      ],
    );
  }

  Widget _buildUserWalletInformations(BuildContext context) {
    return UserInformationItem(
      title: AppStrings.yourWallet,
      imageIcon: ImageAssets.wallet,
      moneyAmount: widget.currentUser.walletAmount,
      lastUpdated: "Last update ${widget.currentUser.lastUpdate}",
    );
  }

  Widget _buildUserLastActivityInformations(BuildContext context) {
    return UserInformationItem(
      title: AppStrings.lastActivity,
      imageIcon: ImageAssets.credit,
      moneyAmount: widget.currentUser.lastActivity,
      lastUpdated: 'Transaction on ${widget.currentUser.lastActivityDate}',
    );
  }

  Widget _buildTestButton(BuildContext context) {
    return CustomLargeButton(
      text: AppStrings.test,
      onTap: () {},
    );
  }

  Widget _buildAddUserSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildUsersText(),
        _buildAddUserIcon(context),
      ],
    );
  }

  Widget _buildUsersText() {
    return const Text(AppStrings.users);
  }

  Widget _buildAddUserIcon(BuildContext context) {
    return CircleAvatar(
      radius: AppSize.s12,
      backgroundColor: ColorManager.white,
      child: InkWell(
          child: const Icon(
            Icons.add,
            size: AppSize.s20,
            color: ColorManager.darkGrey,
          ),
          onTap: () {
            appModalBottomSheet(context);
          }),
    );
  }

  Widget _buildUsersList(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * .22,
        color: ColorManager.transparent,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: BlocProvider.of<AuthCubit>(context).users.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: AppPadding.p20,
              ),
              child: UserItem(
                user: BlocProvider.of<AuthCubit>(context).users[index],
              ),
            );
          }),
        ),
      ),
    );
  }

  void refreshUsers() async {
    setState(() => true);
    BlocProvider.of<AuthCubit>(context).users =
        await UsersDatabase.instance.getAllUsers();
    setState(() => false);
  }

  @override
  void initState() {
    super.initState();
    refreshUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      backgroundColor: ColorManager.backGroundColor,
      body: _buildHomeBloc(),
    );
  }
}
