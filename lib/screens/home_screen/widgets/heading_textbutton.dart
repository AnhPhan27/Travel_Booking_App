import 'package:flutter/material.dart';

import '../../../cons/colors.dart';
import '../../../cons/size_config.dart';
import '../../../widgets/appText.dart';
import 'default_text_button.dart';

class HeadingAndTextButton extends StatelessWidget {
  const HeadingAndTextButton({
    super.key,
    required this.headlineText,
    required this.buttonText,
  });
  final String headlineText;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        // horizontal: getProportionateScreenWidth(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              color: Colors.black,
              text: headlineText,
              size: getProportionateScreenWidth(16),
              fontWeight: FontWeight.w500,
            ),
            DefaultTextButton(
              text: buttonText,
              onPress: () {},
              color: AppColors.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
