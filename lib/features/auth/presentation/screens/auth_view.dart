import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systel_telecom_task/core/color_manager.dart';
import 'package:systel_telecom_task/core/constants.dart';
import 'package:systel_telecom_task/core/route_manager.dart';
import 'package:systel_telecom_task/core/strings_manager.dart';
import 'package:systel_telecom_task/core/values_manager.dart';
import 'package:systel_telecom_task/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:systel_telecom_task/features/auth/presentation/widgets/auth_background_image.dart';
import 'package:systel_telecom_task/features/auth/presentation/widgets/custom_button.dart';
import 'package:systel_telecom_task/features/auth/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils.dart';
import '../widgets/error_message.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorText = AppStrings.defaultError;

  Widget _buildAuthBloc(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Success) {
          Navigator.pushNamed(context, Routes.homeRoute, arguments: state.user);
          showBottomMessage(
            text: AppStrings.welcome,
            context: context,
            color: ColorManager.green,
          );
        }
        if (state is Error) {
          errorText = state.errorText;
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _buildAuthBody(context);
        }
      },
    );
  }

  Widget _buildAuthBody(context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: MediaQuery.of(context).size.height * .15,
          child: _buildBackgroundImage(context),
        ),
        Align(
          alignment: Alignment.center,
          child: _buildAuthForm(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          // heightFactor: heightFactor,
          child: _buildAuthButton(context),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return const AuthBackgroundImage();
  }

  Widget _buildAuthForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p37),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: BlocProvider.of<AuthCubit>(context).showError,
              child: _buildErrorContainer(),
            ),
            const SizedBox(height: AppSize.s10),
            _buildEmailTextField(),
            const SizedBox(height: AppSize.s10),
            _buildPasswordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorContainer() {
    return ErrorMessage(
      errorText: errorText,
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      validator: (value) {
        return checkValidation(value);
      },
      controller: emailController,
      hintText: AppStrings.emailHint,
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      obscureText: true,
      hintText: AppStrings.password,
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  Widget _buildAuthButton(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: Column(
        children: [
          CustomButton(
            text: AppStrings.register,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _sumbitRegisterData();
              }
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .01),
          CustomButton(
            text: AppStrings.login,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _sumbitLoginData();
              }
            },
          ),
        ],
      ),
    );
  }

  _sumbitRegisterData() {
    BlocProvider.of<AuthCubit>(context).register(
      username: emailController.text,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  _sumbitLoginData() {
    BlocProvider.of<AuthCubit>(context).login(
      username: emailController.text,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: _buildAuthBloc(context),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
