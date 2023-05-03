import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/cubit/cubit.dart';

import 'package:practice_simple_travel_app/screens/signin_signup/widgets/default_button.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/widgets/default_textfield.dart';

import '../../cons/size_config.dart';
import '../../widgets/appText.dart';
import '../../widgets/validator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenHeight(72),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        text: 'Forgot Password!',
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
                        text: 'Enter your email account to reset your password',
                        size: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                DefaultTextField(
                    validator: (value) {
                      return EmailAndPhoneValidator.error(
                        value!,
                        SpeciesType.EMAIL,
                      );
                    },
                    isDefault: true,
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined)),
                DefaultTextField(
                    validator: (value) {
                      return EmailAndPhoneValidator.error(
                        value!,
                        SpeciesType.PHONE_NO_1,
                      );
                    },
                    isDefault: true,
                    hintText: 'Phone number',
                    prefixIcon: Icon(Icons.phone_outlined)),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                DefaultButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AppCubits>(context).otpVerification();
                    }
                  },
                  text: 'Continue',
                  isDefeult: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
