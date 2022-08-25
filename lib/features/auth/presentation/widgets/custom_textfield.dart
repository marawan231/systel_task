import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  final bool obscureText;

  Widget _buildTextField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).inputDecorationTheme.hintStyle,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextField(context);
  }
}
