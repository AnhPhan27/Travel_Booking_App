import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:practice_simple_travel_app/cons/colors.dart';
import 'package:practice_simple_travel_app/data/data_favourite.dart';

import '../../cons/size_config.dart';
import '../../widgets/appText.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<DataFavourite> favouritePlace = dataFavourites;
  late GlobalKey<RefreshIndicatorState> refreshKey;
  @override
  void initState() {
    refreshKey = GlobalKey<RefreshIndicatorState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Favourites',
          size: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(20),
            ),
          ),
        ],
      ),
      body: favouritePlace.isEmpty
          ? Center(
              child: AppText(
                text: "Don't have favourtes places",
                size: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            )
          : RefreshIndicator(
              key: refreshKey,
              onRefresh: () async {
                dataFavourites;
              },
              child: Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getProportionateScreenHeight(20),
                    );
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: favouritePlace.length,
                  itemBuilder: (context, index) => Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(20)),
                          flex: 1,
                          onPressed: (context) {
                            onDeletePress(context, index);
                            // setState(() {
                            //   favouritePlace.removeAt(index);
                            // },
                            // );
                          },
                          //  (context) => onPress(context),
                          backgroundColor: Colors.redAccent,
                          icon: Icons.delete,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              topRight: Radius.circular(12)),
                        ),
                      ],
                    ),
                    child: Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(100),
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                      ),
                      // vertical: getProportionateScreenHeight(10)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[100],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(
                                    getProportionateScreenWidth(12)),
                                width: getProportionateScreenWidth(80),
                                height: getProportionateScreenHeight(80),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          favouritePlace[index].path),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: favouritePlace[index].type,
                                      size: getProportionateScreenWidth(14),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    AppText(
                                      text: favouritePlace[index].place,
                                      size: getProportionateScreenWidth(12),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColors.starColor,
                                          size: getProportionateScreenWidth(12),
                                        ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(5),
                                        ),
                                        AppText(
                                          text: favouritePlace[index]
                                              .rating
                                              .toString(),
                                          size: getProportionateScreenWidth(12),
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(15),
                                right: getProportionateScreenWidth(15)),
                            width: getProportionateScreenWidth(24),
                            height: getProportionateScreenHeight(24),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: getProportionateScreenWidth(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Future<dynamic> onDeletePress(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        title: AppText(
          text: 'Remove from Favourites?',
          size: getProportionateScreenWidth(16),
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        content: AppText(
            text:
                'Are you sure you want to remove the trip from your favorites',
            size: getProportionateScreenWidth(14),
            color: AppColors.mainTextColor),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(16)),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    favouritePlace.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child: AppText(
                    color: Colors.white,
                    text: 'Remove',
                    size: getProportionateScreenWidth(14))),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(16)),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: AppText(
                    color: Colors.white,
                    text: 'Cancel',
                    size: getProportionateScreenWidth(14))),
          )
        ],
      ),
    );
  }
}
