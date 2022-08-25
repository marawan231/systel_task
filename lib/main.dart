// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:systel_telecom_task/core/constants.dart';
import 'package:systel_telecom_task/features/auth/business_logic/cubit/auth_cubit.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = appId;
  final keyParseServerUrl = serverUrl;
  await Parse().initialize(keyApplicationId, keyParseServerUrl);

  runApp(BlocProvider(create: (context) => AuthCubit(), child: MyApp()));
}
