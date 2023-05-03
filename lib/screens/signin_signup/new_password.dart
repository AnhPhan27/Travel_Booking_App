import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/widgets/default_textfield.dart';

import '../../cons/size_config.dart';
import '../../cubit/cubit.dart';
import '../../widgets/appText.dart';
import 'widgets/default_button.dart';

class NewPassWord extends StatelessWidget {
  const NewPassWord({super.key});

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
              Container(
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(72),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText(
                      text: 'New Password!',
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
                      text: 'Create a strong password',
                      size: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              const DefaultTextField(
                  isDefault: true,
                  hintText: 'New Password',
                  prefixIcon: Icon(Icons.lock_outline)),
              const DefaultTextField(
                  isDefault: true,
                  hintText: 'Re-type New Password',
                  prefixIcon: Icon(Icons.lock_outline)),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              DefaultButton(
                onTap: () {
                  BlocProvider.of<AppCubits>(context).signIn();
                },
                text: 'Finish Setup',
                isDefeult: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
