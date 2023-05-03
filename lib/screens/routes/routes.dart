import 'package:flutter/widgets.dart';
import 'package:practice_simple_travel_app/screens/detail_screen.dart/detail_screen.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/forgot_password_screen.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/new_password.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/otp_verification.dart';
import '../home_screen/home_screen.dart';
import '../tab_screens/nav_screen.dart';
import '../signin_signup/signin_screen.dart';
import '../signin_signup/signup_screen.dart';
import '../welcome/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/welcome_screen': (context) => WelcomeScreen(),
  '/home': (context) => HomeScreen(),
  '/nav': (context) => NavScreen(),
  '/detail_screen': (context) => DetailScreen(),
  '/signup_screen': (context) => SignUpScreen(),
  '/signin_screen': (context) => SignInScreen(),
  '/forgot_password': (context) => ForgotPasswordScreen(),
  '/otp_verification': (context) => OTPVerification(),
  '/new_password': (context) => NewPassWord(),
};
