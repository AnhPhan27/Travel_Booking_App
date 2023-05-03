import 'package:flutter/material.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';

class DefaultTextField extends StatelessWidget {
  final double? width;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isDefault;
  const DefaultTextField(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.width,
      this.controller,
      this.validator,
      this.isDefault = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isDefault ? double.infinity : getProportionateScreenWidth(280),
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: getProportionateScreenWidth(12)),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
