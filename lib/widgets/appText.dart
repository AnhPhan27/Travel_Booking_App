import 'package:flutter/material.dart';

import '../cons/size_config.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? align;

  const AppText(
      {super.key,
      required this.text,
      this.align,
      this.color = Colors.black54,
      required this.size,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
