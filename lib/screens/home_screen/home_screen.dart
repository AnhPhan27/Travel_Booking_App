// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/cubit/cubit_states.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';

import 'package:practice_simple_travel_app/cons/size_config.dart';

import '../../cubit/cubit.dart';
import '../../models/data_models.dart';
import '../nav_bar/nav_bar.dart';
import 'notifications_screen.dart';
import 'widgets/best_deals_card.dart';
import 'widgets/categories.dart';

import 'widgets/categories_tab.dart';
import 'widgets/heading_textbutton.dart';
import 'widgets/searchbar.dart';
import 'widgets/tabview.dart';
import 'widgets/trending_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
        builder: (BuildContext context, state) {
      if (state is LoadedState) {
        final List<DataModel> info;
        info = state.places;
        return Scaffold(
          drawer: const NavBar(),
          appBar: AppBar(
            actions: [
              Container(
                width: getProportionateScreenWidth(30),
                height: getProportionateScreenHeight(30),
                margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: getProportionateScreenWidth(0.5),
                      color: AppColors.mainTextColor,
                    )),
                child: IconButton(
                  padding: EdgeInsets.all(1),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                  },
                  icon: Icon(
                    color: Colors.black45,
                    Icons.notifications_none,
                    size: getProportionateScreenWidth(20),
                  ),
                ),
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HeadingText(),
                      const SearchBar(),
                      CategoriesTab(tabController: _tabController),
                      TabView(tabController: _tabController, info: info),
                      const HeadingAndTextButton(
                        buttonText: 'See All',
                        headlineText: 'Browse by Categories',
                      ),
                      const Categories(),
                      const HeadingAndTextButton(
                        buttonText: 'See All',
                        headlineText: 'Trending Destinations',
                      ),
                      const TrendingCard(),
                      const HeadingAndTextButton(
                        buttonText: 'See All',
                        headlineText: 'Best Deals',
                      ),
                      BestDealsCard()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return Container(
          child: const Text(
            'An',
            style: TextStyle(fontSize: 50, color: Colors.amber),
          ),
        );
      }
    });
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      width: double.infinity,
      height: getProportionateScreenHeight(70),
      child: RichText(
        text: TextSpan(
          text: 'Where Do You\nWant To',
          style: TextStyle(
            fontFamily: 'CabinetGrotesk',
            fontSize: getProportionateScreenWidth(26),
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          children: [
            TextSpan(
                text: ' Discover',
                style: TextStyle(
                    fontFamily: 'CabinetGrotesk',
                    fontSize: getProportionateScreenWidth(26),
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
