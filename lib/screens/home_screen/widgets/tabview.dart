import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cons/colors.dart';
import '../../../cons/size_config.dart';
import '../../../cubit/cubit.dart';
import '../../../models/data_models.dart';
import '../../../widgets/appText.dart';

class TabView extends StatelessWidget {
  const TabView({
    super.key,
    required TabController tabController,
    required this.info,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<DataModel> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      height: getProportionateScreenHeight(300),
      width: double.infinity,
      child: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: info.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
              },
              child: Container(
                margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(270),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            width: double.infinity,
                            height: getProportionateScreenHeight(200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://mark.bslmeiyu.com/uploads/${info[index].img}'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenHeight(10),
                            getProportionateScreenHeight(10),
                            getProportionateScreenWidth(10),
                            getProportionateScreenHeight(6)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: info[index].name,
                              color: Colors.black,
                              size: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w500,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.starColor,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(2),
                                  ),
                                  AppText(
                                      text: info[index].stars.toString(),
                                      size: getProportionateScreenWidth(12))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10)),
                        child: AppText(
                            text: info[index].location,
                            size: getProportionateScreenWidth(12)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(6),
                            left: getProportionateScreenWidth(10)),
                        child: AppText(
                            text: "\$${info[index].price.toString()}",
                            color: Colors.black,
                            size: getProportionateScreenWidth(12)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Text(''),
          const Text(''),
          const Text(''),
          const Text(''),
          const Text(''),
        ],
      ),
    );
  }
}
