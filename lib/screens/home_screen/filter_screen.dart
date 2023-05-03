import 'package:flutter/material.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/screens/home_screen/widgets/default_text_button.dart';
import 'package:practice_simple_travel_app/screens/signin_signup/widgets/default_textfield.dart';

import '../../cons/size_config.dart';
import '../../widgets/appText.dart';
import 'widgets/header_textfiled.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> categories = [
    'All',
    'Mountain',
    'Lake',
    'Camping',
    'Rafting',
    'Hiking',
    'Scenery',
    'Beach',
    'Jungle Safari',
    'Boating'
  ];

  RangeValues values = const RangeValues(0, 200);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Filter',
          size: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(205),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: 'Categories',
                          size: getProportionateScreenWidth(18),
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        DefaultTextButton(
                          text: 'See all',
                          onPress: () {},
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    Wrap(
                      children: List.generate(
                        categories.length,
                        (index) => Container(
                          margin: EdgeInsets.only(
                              right: getProportionateScreenWidth(20),
                              top: getProportionateScreenHeight(10)),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(color: Colors.black, width: 0.5)),
                          child: AppText(
                              text: categories[index],
                              size: getProportionateScreenWidth(14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // decoration: BoxDecoration(color: AppColors.mainTextColor),
                width: double.infinity,
                height: getProportionateScreenHeight(100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        text: 'Price range',
                        size: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10)),
                      child: SliderTheme(
                        data: SliderThemeData(
                          valueIndicatorColor: Colors.white,
                          thumbColor: AppColors.mainColor,
                          activeTrackColor: AppColors.mainColor,
                          inactiveTrackColor: Colors.grey[500],
                          showValueIndicator: ShowValueIndicator.always,
                          valueIndicatorTextStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'CabinetGrotesk'),
                          // thumbShape:
                        ),
                        child: RangeSlider(
                            min: 0,
                            max: 200,
                            labels: labels,
                            divisions: 4,
                            values: values,
                            onChanged: (newValues) {
                              setState(() {
                                values = newValues;
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ),
              const HeaderAndTextField(
                header: 'Location',
                hintText: 'Search Places',
                prefixIcon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
