import 'package:flutter/material.dart';

import '../../../cons/colors.dart';
import '../../../cons/size_config.dart';

class SlideBar extends StatelessWidget {
  const SlideBar({
    super.key,
    required this.images,
    required this.index,
  });

  final List images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        images.length,
        (indexDots) => AnimatedContainer(
          decoration: BoxDecoration(
              color: index == indexDots
                  ? AppColors.mainColor
                  : AppColors.textColor1,
              borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(bottom: getProportionateScreenHeight(5)),
          duration: Duration(milliseconds: 200),
          width: getProportionateScreenWidth(10),
          height: index == indexDots
              ? getProportionateScreenHeight(50)
              : getProportionateScreenHeight(10),
        ),
      ),
    );
  }
}
