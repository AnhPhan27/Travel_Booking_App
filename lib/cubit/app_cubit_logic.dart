import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';
import 'package:practice_simple_travel_app/cubit/cubit.dart';
import 'package:practice_simple_travel_app/cubit/cubit_states.dart';
import 'package:practice_simple_travel_app/screens/detail_screen.dart/detail_screen.dart';
import 'package:practice_simple_travel_app/screens/home_screen/home_screen.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/forgot_password_screen.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/new_password.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/otp_verification.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/signin_screen.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/signup_screen.dart';
import 'package:practice_simple_travel_app/screens/welcome/welcome_screen.dart';
import 'package:practice_simple_travel_app/widgets/appText.dart';

import '../cons/colors.dart';
import '../screens/tab_screens/nav_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomeScreen();
          } else if (state is SignUpState) {
            return SignUpScreen();
          } else if (state is SignInState) {
            return SignInScreen();
          } else if (state is OTPVerificationState) {
            return const OTPVerification();
          } else if (state is NewPasswordState) {
            return const NewPassWord();
          } else if (state is DetailState) {
            return const DetailScreen();
          } else if (state is LogOutState) {
            return WelcomeScreen();
          } else if (state is ForgotPasswordState) {
            return ForgotPasswordScreen();
          } else if (state is LoadingState) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.mainColor));
          } else if (state is LoadedState) {
            return NavScreen();
          } else if (state is DetailState) {
            return const DetailScreen();
          } else if (state is ErrorState) {
            return Center(
              child: AppText(
                text: state.message,
                size: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
