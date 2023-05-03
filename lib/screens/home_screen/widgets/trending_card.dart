import 'package:flutter/material.dart';

import '../../../cons/colors.dart';
import '../../../cons/size_config.dart';

import '../../../data/trending_destinations.dart';
import '../../../widgets/appText.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: getProportionateScreenHeight(360),
        height: getProportionateScreenHeight(360),
        child: GridView.builder(
          itemCount: trendingDestinations.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 1),
          itemBuilder: (BuildContext context, int index) {
            final _info = trendingDestinations[index];
            return Container(
              margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenHeight(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage('assets/images/${_info.path}'),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(12),
                          right: getProportionateScreenWidth(12)),
                      width: getProportionateScreenWidth(24),
                      height: getProportionateScreenHeight(24),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: getProportionateScreenWidth(14),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: getProportionateScreenHeight(66),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10),
                          horizontal: getProportionateScreenWidth(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                  text: _info.place,
                                  size: getProportionateScreenWidth(12),
                                  color: Colors.white),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.starColor,
                                      size: getProportionateScreenWidth(10),
                                    ),
                                    AppText(
                                      text: _info.rating.toString(),
                                      size: getProportionateScreenWidth(10),
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AppText(
                            text: '\$${_info.price.toString()}',
                            size: getProportionateScreenWidth(12),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },

          //
        ));
  }
}
