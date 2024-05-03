import 'package:flutter/material.dart';
import 'package:recipes_app/utils/constants/colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final String? Function(String?)? validator;
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.icon,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(icon),
        labelText: labelText,
      ),
    );
  }
}
