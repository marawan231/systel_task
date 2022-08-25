import 'package:flutter/material.dart';

import '../../../../core/assets_manager.dart';

class HomeBackgroundImage extends StatelessWidget {
  const HomeBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .62,
      child: Image.asset(
        ImageAssets.homeBackgroundImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
