import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cubit/cubit_states.dart';
import 'package:practice_simple_travel_app/screens/detail_screen.dart/widgets/app_button.dart';
import 'package:practice_simple_travel_app/widgets/appText.dart';
import 'package:practice_simple_travel_app/widgets/responsive_button.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';

import '../../cubit/cubit.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (BuildContext context, state) {
        DetailState detail = state as DetailState;

        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(350),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/${detail.place.img}'),
                            fit: BoxFit.fill)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(50),
                        horizontal: getProportionateScreenWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenWidth(250)),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(40)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: state.place.name,
                                size: getProportionateScreenWidth(26),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              AppText(
                                text: '\$ ${detail.place.price.toString()}',
                                size: getProportionateScreenWidth(26),
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.place,
                                  color: AppColors.mainColor,
                                  size: getProportionateScreenWidth(20),
                                ),
                                SizedBox(width: getProportionateScreenWidth(5)),
                                AppText(
                                  text: state.place.location,
                                  size: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.w200,
                                  color: AppColors.mainColor,
                                ),
                              ],
                            ),
                          ),
                          Ratings(
                            gottenStar: state.place.stars,
                            rating: "(${state.place.stars.toString()})",
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          AppText(
                            text: 'People',
                            size: getProportionateScreenWidth(22),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          AppText(
                            text: 'Number of people on your group',
                            size: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w200,
                            color: AppColors.textColor2,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AppButtons(
                                  text: '${index + 1}'.toString(),
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 55,
                                  textColor: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  // isIcon: true,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          AppText(
                            text: 'Description',
                            size: getProportionateScreenWidth(28),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          AppText(
                            text: state.place.description,
                            size: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor2,
                          ),
                          SizedBox(height: getProportionateScreenHeight(40)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              AppButtons(
                                size: 60,
                                backgroundColor: AppColors.buttonBackground,
                                iconData: Icons.favorite_border,
                                isIcon: true,
                                iconColor: AppColors.mainColor,
                              ),
                              ReponsiveButton(
                                text: 'Book now',
                                reponsive: true,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Ratings extends StatelessWidget {
  const Ratings({
    super.key,
    required this.gottenStar,
    required this.rating,
  });

  final int gottenStar;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < gottenStar
                  ? AppColors.starColor
                  : AppColors.textColor1,
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        AppText(
            text: rating,
            size: getProportionateScreenWidth(14),
            color: AppColors.textColor2)
      ],
    );
  }
}
