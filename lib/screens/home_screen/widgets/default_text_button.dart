import 'package:flutter/material.dart';

import '../../../cons/size_config.dart';
import '../../../widgets/appText.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    required this.text,
    this.color = Colors.grey,
    required this.onPress,
  });
  final String text;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: AppText(
        text: text,
        size: getProportionateScreenWidth(14),
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}
