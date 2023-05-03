import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';
import 'package:practice_simple_travel_app/cubit/cubit_states.dart';
import 'package:practice_simple_travel_app/screens/home_screen/widgets/default_text_button.dart';

import 'package:practice_simple_travel_app/widgets/appText.dart';

import '../../cubit/cubit.dart';
import '../../widgets/validator.dart';
import 'widgets/default_button.dart';
import 'widgets/default_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(274),
                    height: getProportionateScreenHeight(72),
                    child: Column(
                      children: [
                        const AppText(
                          text: 'Lets Get Started',
                          size: 20,
                          fontWeight: FontWeight.w600,
                          align: TextAlign.center,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        AppText(
                          text: 'Please fill the details and create account',
                          size: getProportionateScreenWidth(12),
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  DefaultTextField(
                      validator: (value) => SignUpScreenValidator.error(
                            value!,
                            SpeciesType.USERNAME,
                          ),
                      isDefault: true,
                      hintText: 'User Name',
                      prefixIcon: Icon(Icons.person_2_outlined)),
                  DefaultTextField(
                    validator: (value) {
                      return SignUpScreenValidator.error(
                        value!,
                        SpeciesType.EMAIL,
                      );
                    },
                    isDefault: true,
                    hintText: 'Sign Up E-mail',
                    prefixIcon: Icon(Icons.mail_outline_outlined),
                  ),
                  DefaultTextField(
                      validator: (value) {
                        return SignUpScreenValidator.error(
                          value!,
                          SpeciesType.PASSWORD_1,
                        );
                      },
                      isDefault: true,
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline)),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  DefaultButton(
                    onTap: () {
                      _formKey.currentState!.validate();
                    },
                    text: 'Sign Up',
                    isDefeult: true,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(30)),
                    child: AppText(
                        text: 'Or Use Instant Sign Up',
                        size: getProportionateScreenWidth(12)),
                  ),
                  DefaultButton(
                    onTap: () {},
                    text: 'Using Apple ID',
                    icon: Icons.apple,
                    color: Colors.black,
                    pathImage: 'assets/images/apple_logo.png',
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  DefaultButton(
                    onTap: () {},
                    text: 'Using Apple ID',
                    color: Colors.black,
                    pathImage: 'assets/images/google.png',
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: 'Already have an account?',
                            size: getProportionateScreenWidth(12),
                          ),
                          DefaultTextButton(
                              onPress: () {
                                // Navigator.of(context).pushNamed('/signin_screen');
                                BlocProvider.of<AppCubits>(context).signIn();
                              },
                              text: 'Sign In',
                              color: AppColors.mainColor)
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
