import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cubit/cubit.dart';
import 'package:practice_simple_travel_app/screens/detail_screen.dart/widgets/app_button.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/widgets/default_button.dart';

import '../../cons/size_config.dart';
import '../../widgets/appText.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Container(
          width: double.infinity,
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                width: getProportionateScreenWidth(240),
                height: getProportionateScreenHeight(80),
                child: Column(
                  children: [
                    const AppText(
                      text: 'OTP Verification!',
                      size: 20,
                      fontWeight: FontWeight.w700,
                      align: TextAlign.center,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    AppText(
                      align: TextAlign.center,
                      text:
                          'OTP code has been sent to the specified number. Please check your phone for the verification code',
                      size: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              OTPForm(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(30)),
                child: DefaultButton(
                  onTap: () {
                    BlocProvider.of<AppCubits>(context).newPassword();
                  },
                  text: 'Verify',
                  isDefeult: true,
                ),
              ),
              Text(
                'Resend Code',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  color: Colors.black54,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OTPForm extends StatelessWidget {
  const OTPForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) => Container(
          margin: EdgeInsets.only(
            top: getProportionateScreenHeight(30),
          ),
          width: getProportionateScreenHeight(60),
          height: getProportionateScreenHeight(60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.buttonBackground),
          child: Center(
            child: TextField(
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                if (value == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
