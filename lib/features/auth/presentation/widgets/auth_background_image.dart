import 'package:flutter/material.dart';
import '../../../../core/assets_manager.dart';

class AuthBackgroundImage extends StatelessWidget {
  const AuthBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        ImageAssets.background,
        fit: BoxFit.cover,
      ),
    );
  }
}
