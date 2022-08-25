import 'package:flutter/material.dart';

import '../features/home/presentation/widgets/add_user_view.dart';
import 'color_manager.dart';

checkValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid data';
  }
}

int idGenerator() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch;
}

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    actions: _buildAppBarActions(context),
  );
}

List<Widget> _buildAppBarActions(BuildContext context) {
  return [
    Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .1),
      child: Row(
        children: [
          _buildNotificationIcon(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .04,
          ),
          _buildMenuIcon(),
        ],
      ),
    ),
  ];
}

Widget _buildNotificationIcon() {
  return const Icon(Icons.notifications_none);
}

Widget _buildMenuIcon() {
  return const Icon(Icons.menu);
}

void appModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (context) {
      return Container(
        color: ColorManager.backGroundColor,
        height: 500,
        child: const AddUserView(),
      );
    },
  );
}
