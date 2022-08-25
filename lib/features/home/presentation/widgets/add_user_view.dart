import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systel_telecom_task/core/strings_manager.dart';
import '../../../../core/utils.dart';
import '../../../../core/values_manager.dart';
import '../../../auth/business_logic/cubit/auth_cubit.dart';
import '../../../auth/presentation/widgets/custom_button.dart';
import '../../../auth/presentation/widgets/custom_textfield.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String errorText = AppStrings.defaultError;

  Widget _buildAuthBody(context) {
    return ListView(
      children: [
        _buildAuthForm(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .07,
        ),
        _buildAuthButton(context),
      ],
    );
  }

  Widget _buildAuthButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1),
      child: CustomButton(
        text: AppStrings.addUsers,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<AuthCubit>(context)
                .addUser(userNameController.text, amountController.text);
          }
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildAuthForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p37),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildEmailTextField(),
            const SizedBox(height: 10),
            _buildAmountTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      validator: (value) {
        return checkValidation(value);
      },
      controller: userNameController,
      hintText: AppStrings.userName,
    );
  }

  Widget _buildAmountTextField() {
    return CustomTextField(
      controller: amountController,
      hintText: AppStrings.amountOfMoney,
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAuthBody(context);
  }
}
