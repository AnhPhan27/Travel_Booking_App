import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cons/colors.dart';
import '../../../cons/size_config.dart';
import '../../../cubit/cubit.dart';
import '../../../widgets/appText.dart';
import '../../../widgets/responsive_button.dart';

class TextAndDefaultButton extends StatelessWidget {
  const TextAndDefaultButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Trips',
            style: TextStyle(
                fontFamily: 'CabinetGrotesk',
                fontSize: getProportionateScreenWidth(30),
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '\nMountain',
                style: TextStyle(
                    fontFamily: 'CabinetGrotesk',
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(30)),
              ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40)),
        AppText(
          text:
              'Mountain hikes give you an incredible\nsense of freedom along with\nendurance test',
          size: getProportionateScreenWidth(16),
          color: Colors.white,
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        GestureDetector(
          onTap: () => BlocProvider.of<AppCubits>(context).signUp(),
          // onTap: () {
          //   Navigator.pushNamed(context, '/signup_screen');
          // },
          // =>
          // BlocProvider.of<AppCubits>(context).getData(),
          child: SizedBox(
            width: getProportionateScreenWidth(200),
            child: Row(
              children: [
                ReponsiveButton(
                    reponsive: false,
                    width: getProportionateScreenWidth(120),
                    text: 'Sign In'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
