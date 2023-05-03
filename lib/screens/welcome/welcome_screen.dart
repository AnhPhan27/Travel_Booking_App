import 'package:flutter/material.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';
import 'widgets/slide_bar.dart';
import 'widgets/text_default_button.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  List images = [
    "welcome1.png",
    "welcome2.png",
    "welcome3.png",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PageView.builder(
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.9,
              image: AssetImage("assets/images/${images[index]}"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(150),
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const TextAndDefaultButton(),
                SlideBar(images: images, index: index),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
