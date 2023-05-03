import 'package:flutter/material.dart';

import '../../../cons/size_config.dart';
import '../../../widgets/appText.dart';
import '../../signin_signup/widgets/default_textfield.dart';

class HeaderAndTextField extends StatelessWidget {
  const HeaderAndTextField({
    super.key,
    required this.header,
    required this.hintText,
    this.prefixIcon,
  });
  final String header;
  final String hintText;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(30)),
      width: double.infinity,
      height: getProportionateScreenHeight(95),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: header,
            size: getProportionateScreenWidth(18),
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          DefaultTextField(
            hintText: hintText,
            prefixIcon: prefixIcon,
            isDefault: true,
          ),
        ],
      ),
    );
  }
}
