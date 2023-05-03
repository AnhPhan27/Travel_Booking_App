// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
    this.isDefeult = false,
    this.color = Colors.white,
    this.pathImage,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final Color color;
  final IconData? icon;
  final bool isDefeult;
  final String? pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
      width: double.infinity,
      height: getProportionateScreenHeight(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isDefeult ? AppColors.mainColor : Colors.grey[100],
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isDefeult
                    ? Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontSize: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.bold),
                      )
                    : Row(
                        children: [
                          Container(
                            child: Image(image: AssetImage(pathImage!)),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(20),
                          ),
                          Text(
                            text,
                            style: TextStyle(
                                color: color,
                                fontSize: getProportionateScreenWidth(14),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
