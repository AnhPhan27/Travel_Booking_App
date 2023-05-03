import 'package:flutter/material.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/cons/size_config.dart';

import 'package:practice_simple_travel_app/screens/home_screen/home_screen.dart';
import 'package:practice_simple_travel_app/screens/tab_screens/favourite_screen.dart';
import 'package:practice_simple_travel_app/screens/tab_screens/account_screen.dart';

import 'calendar_screen.dart';

class NavScreen extends StatefulWidget {
  NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {
  // final List<Widget> _screen = [
  //   HomeScreen(),
  //   const BarScreen(),
  //   const SearchScreen(),
  //   const UserScreen(),
  // ];

  // final Map<String, IconData> _icons = {
  //   'Home': Icons.apps,
  //   'Bar': Icons.bar_chart_sharp,
  //   'Search': Icons.search,
  //   'User': Icons.person,
  // };

  // int _currentPage = 0;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: [
        HomeScreen(),
        const CalendarScreen(),
        const FavouriteScreen(),
        const AccountScreen()
      ]),
      // _screen[_currentPage],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        // width: double.maxFinite,
        margin: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10)),
            ]),
        // child: ClipRRect(
        //   borderRadius: BorderRadius.all(Radius.circular(50)),
        //   child: Container(
        //     color: Colors.white,
        child: TabBar(
          indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.black),
              insets: EdgeInsets.fromLTRB(50, 0, 50, 40)),
          controller: _tabController,
          labelColor: AppColors.mainColor,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(
              icon: Icon(Icons.explore),
              text: 'Explore',
            ),
            Tab(
              icon: Icon(Icons.calendar_month_outlined),
              text: 'Calendar',
            ),
            Tab(
              icon: Icon(Icons.favorite_border_outlined),
              text: 'Favourire',
            ),
            Tab(
              icon: Icon(Icons.person_2_outlined),
              text: 'User',
            ),
          ],
        ),
      ),

      // BottomNavigationBar(
      //   onTap: (value) {
      //     setState(() {
      //       _currentPage = value;
      //     });
      //   },
      //   currentIndex: _currentPage,
      //   selectedItemColor: AppColors.mainColor,
      //   unselectedItemColor: AppColors.textColor1,
      //   showSelectedLabels: false,
      //   items: _icons
      //       .map(
      //         (title, icon) => MapEntry(
      //           title,
      //           BottomNavigationBarItem(icon: Icon(icon), label: title),
      //         ),
      //       )
      //       .values
      //       .toList(),
      // ),
      //   ),
      // ),
    );
  }
}
