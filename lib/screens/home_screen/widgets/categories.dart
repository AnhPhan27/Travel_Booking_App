import 'package:flutter/material.dart';

import '../../../cons/size_config.dart';
import '../../../data/data_categories.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(108),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataCategories.length,
        itemBuilder: (context, index) => Container(
          width: getProportionateScreenWidth(80),
          height: getProportionateScreenHeight(120),
          margin: EdgeInsets.only(
            right: getProportionateScreenWidth(15),
          ),
          child: Column(
            children: [
              Container(
                width: getProportionateScreenWidth(80),
                height: getProportionateScreenHeight(80),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${dataCategories[index].path}'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(16)),
              ),
              Text(
                dataCategories[index].type,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: getProportionateScreenWidth(12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
