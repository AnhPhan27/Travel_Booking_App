import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';
import 'package:practice_simple_travel_app/cubit/cubit.dart';
import 'package:practice_simple_travel_app/screens/home_screen/widgets/default_text_button.dart';
import 'package:practice_simple_travel_app/widgets/appText.dart';
import 'widgets/default_button.dart';
import 'widgets/default_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

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
                  width: getProportionateScreenWidth(274),
                  height: getProportionateScreenHeight(72),
                  child: Column(
                    children: [
                      const AppText(
                        text: 'Hello!',
                        size: 20,
                        fontWeight: FontWeight.w700,
                        align: TextAlign.center,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      AppText(
                        text: 'Welcome to Roamate',
                        size: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
                DefaultTextField(
                    isDefault: true,
                    validator: (value) {
                      return NPValidator.error(
                        value!,
                        SpeciesType.USERNAME,
                      );
                    },
                    controller: _userController,
                    hintText: 'User Name',
                    prefixIcon: const Icon(Icons.person_2_outlined)),
                DefaultTextField(
                    isDefault: true,
                    validator: (value) {
                      return NPValidator.error(
                        value!,
                        SpeciesType.PASSWORD_1,
                      );
                    },
                    controller: _passwordController,
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline)),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: DefaultTextButton(
                    onPress: () {
                      BlocProvider.of<AppCubits>(context).forgotPassword();
                    },
                    text: 'Forgot Password',
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                DefaultButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AppCubits>(context).getData();
                    }
                  },
                  text: 'Sign In',
                  isDefeult: true,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                DefaultButton(
                  onTap: () {},
                  text: 'Login with Fingerprint',
                  icon: Icons.apple,
                  color: Colors.black,
                  pathImage: 'assets/images/fingerprint.png',
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Don't have an account?",
                          size: getProportionateScreenWidth(14),
                        ),
                        DefaultTextButton(
                            onPress: () {},
                            text: 'Sign Up',
                            color: AppColors.mainColor)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
