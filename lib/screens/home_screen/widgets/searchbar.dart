import 'package:flutter/material.dart';
import 'package:practice_simple_travel_app/screens/home_screen/filter_screen.dart';
import 'package:practice_simple_travel_app/screens/routes/routes.dart';

import '../../../cons/size_config.dart';
import '../../signin_signup/widgets/default_textfield.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTextField(
            width: getProportionateScreenWidth(280),
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.mic),
          ),
          InkWell(
            child: Container(
              // margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
              width: getProportionateScreenWidth(50),
              height: getProportionateScreenHeight(50),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage('assets/images/Vector.png')),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
