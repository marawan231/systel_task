import 'package:flutter/material.dart';

const appId = 'com.voyce';
const serverUrl = 'https://test.voycephone.com/parse/';
const int quarterTurns = 3;
const double heightFactor = 15.5;
showBottomMessage({required var text, required context, Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text.toString(),
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
    ),
  );
}
