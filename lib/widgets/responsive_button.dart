// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/widgets/appText.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';

class ReponsiveButton extends StatelessWidget {
  final double? width;
  // final VoidCallback onPress;
  final bool reponsive;
  final String text;
  const ReponsiveButton({
    Key? key,
    this.width = 60,
    this.reponsive = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // margin: EdgeInsets.only(
        //   top: getProportionateScreenHeight(50),
        // ),
        height: getProportionateScreenHeight(60),
        width: reponsive ? 280 : width,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(12)),

        child: Row(
          mainAxisAlignment: reponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            reponsive
                ? Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppText(
                      text: text,
                      size: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Container(),
            Container(
              child: Image(
                image: AssetImage('assets/images/button-one.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
