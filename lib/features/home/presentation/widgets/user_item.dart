import 'package:flutter/material.dart';
import 'package:systel_telecom_task/features/home/presentation/widgets/user_avatar.dart';
import '../../../../core/values_manager.dart';
import '../../../auth/data/model/user.dart';
import 'user_item_container.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.user}) : super(key: key);
  final User user;

  Widget _buildUserItemContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .015),
      child: UserItemContainer(user: user),
    );
  }

  _buildUserAvatar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * .048,
      ),
      child: const Align(
        alignment: Alignment.topCenter,
        child: UserAvatar(
          radius: AppSize.s25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildUserItemContainer(context),
        _buildUserAvatar(context),
      ],
    );
  }
}
