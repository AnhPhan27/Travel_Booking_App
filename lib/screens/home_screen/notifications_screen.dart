import 'package:flutter/material.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';

import '../../cons/size_config.dart';
import '../../widgets/appText.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Notifications',
          size: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(130),
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),

        // vertical: getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(10),
                  top: getProportionateScreenHeight(10)),
              child: Row(
                children: [
                  Image.asset('assets/images/hot-deal (1) 1.png'),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  AppText(
                    text: 'Hot Deal',
                    size: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainColor,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(getProportionateScreenWidth(12)),
                  width: getProportionateScreenWidth(70),
                  height: getProportionateScreenHeight(70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage('assets/images/camping1.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Global Camping',
                        size: getProportionateScreenWidth(14),
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: 'Offer Valid till 5days only.',
                        size: getProportionateScreenWidth(12),
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              AppText(
                                text: '\$95',
                                size: getProportionateScreenWidth(12),
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              Positioned(
                                  top: getProportionateScreenHeight(7),
                                  child: Container(
                                    width: getProportionateScreenWidth(22),
                                    height: getProportionateScreenHeight(0.5),
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          AppText(
                            text: '\$${(95 * 0.8).ceil()}',
                            size: getProportionateScreenWidth(12),
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
