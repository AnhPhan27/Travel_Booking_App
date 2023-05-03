import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/widgets/appText.dart';

import '../../cons/size_config.dart';
import '../../cubit/cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Account',
          size: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenHeight(30)),
              width: double.infinity,
              height: SizeConfig.screenHeight / 3,
              child: Column(
                children: [
                  Stack(
                    children: [
                      const SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/account.png'),
                        ),
                      ),
                      Positioned(
                        right: getProportionateScreenWidth(-10),
                        bottom: getProportionateScreenHeight(-5),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.penToSquare,
                            size: getProportionateScreenWidth(14),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(10),
                        bottom: getProportionateScreenHeight(5)),
                    child: AppText(
                        text: 'AnhPhan',
                        size: getProportionateScreenWidth(20),
                        color: Colors.black),
                  ),
                  AppText(
                      text: 'ducanh.phan1227@gmail.com',
                      size: getProportionateScreenWidth(14))
                ],
              ),
            ),
            const AccountMenuCard(
              icon: Icons.person_2_outlined,
              text: 'Profile',
            ),
            const AccountMenuCard(
              icon: Icons.lock_open,
              text: 'Security & privacy',
            ),
            const AccountMenuCard(
              icon: Icons.notifications_active,
              text: 'Notifications',
            ),
            const AccountMenuCard(
              icon: Icons.language_outlined,
              text: 'Language',
            ),
            AccountMenuCard(
              onTap: () {
                BlocProvider.of<AppCubits>(context).logOut();
              },
              icon: Icons.logout,
              text: 'Logout',
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AccountMenuCard extends StatelessWidget {
  const AccountMenuCard({
    super.key,
    required this.text,
    required this.icon,
    this.isLogout = false,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final bool isLogout;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(5)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: getProportionateScreenWidth(0.5),
              color: AppColors.mainTextColor)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: getProportionateScreenWidth(20),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  AppText(
                    text: text,
                    size: getProportionateScreenWidth(16),
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
            isLogout
                ? Container(
                    // width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(42),
                  )
                : IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right,
                      size: getProportionateScreenWidth(20),
                    ))
          ],
        ),
      ),
    );
  }
}
