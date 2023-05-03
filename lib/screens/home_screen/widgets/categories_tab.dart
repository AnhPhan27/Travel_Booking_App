import 'package:flutter/material.dart';

import '../../../cons/colors.dart';
import '../../../cons/size_config.dart';
import '../home_screen.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
        child: TabBar(
          labelPadding: EdgeInsets.only(
              left: getProportionateScreenWidth(5),
              right: getProportionateScreenHeight(20)),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            fontFamily: 'CabinetGrotesk',
          ),
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
          tabs: const [
            Tab(
              text: 'Popular',
            ),
            Tab(text: 'Featured'),
            Tab(text: 'Most Visited'),
            Tab(text: 'Asia'),
            Tab(text: 'Europe'),
            Tab(text: 'Africa'),
          ],
        ),
      ),
    );
  }
}
