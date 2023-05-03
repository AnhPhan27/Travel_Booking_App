import 'package:flutter/material.dart';

import '../../../cons/size_config.dart';

class AppButtons extends StatelessWidget {
  final String? text;
  final Color backgroundColor;
  final Color? textColor;
  final int size;
  final bool isIcon;
  final IconData? iconData;
  final Color? iconColor;
  const AppButtons(
      {super.key,
      this.text,
      required this.size,
      this.iconData,
      this.isIcon = false,
      required this.backgroundColor,
      this.textColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getProportionateScreenWidth(5)),
      width: getProportionateScreenWidth(60),
      height: getProportionateScreenHeight(60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor),
      child: isIcon
          ? Center(child: Icon(iconData, color: iconColor))
          : Center(
              child: Text(
              text!,
              style: TextStyle(color: textColor),
            )),
    );
  }
}
