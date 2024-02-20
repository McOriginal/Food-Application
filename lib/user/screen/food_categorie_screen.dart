import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/dejeuner_category_view.dart';
import 'package:food_app/user/screen/diner_view.dart';
import 'package:food_app/user/screen/p_dejeuner_view.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  // ********************
  // PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  // bool isSelected = false;
  // ********************

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Mk Restaurant",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Gloock-Regular",
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 35,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 5, right: 15, left: 15),
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.solid,
                        offset: Offset(2, 2),
                        color: Colors.grey,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  labelStyle: const TextStyle(
                    letterSpacing: 3,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Gloock-Regular",
                    color: Colors.white,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    tabsItem(title: "Petit Déjeuner"),
                    tabsItem(title: "Déjeuner"),
                    tabsItem(title: "Diner"),
                  ],
                ),
              ),
              Divider(thickness: 1, color: AppColors.iconColor),
              const Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    PetitDejeunerView(),
                    DejeunerView(),
                    DinerView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding tabsItem({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        // margin: const EdgeInsets.only(top: 30),
        width: 110,
        height: 40,
        // decoration: BoxDecoration(
        //   color: AppColors.secondaryColor,
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: const [
        //     BoxShadow(
        //       blurStyle: BlurStyle.solid,
        //       offset: Offset(2, 2),
        //       color: Colors.grey,
        //       blurRadius: 5,
        //     )
        //   ],
        // ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            //   style: const TextStyle(
            //     letterSpacing: 3,
            //     fontSize: 14,
            //     fontWeight: FontWeight.bold,
            //     fontFamily: "Gloock-Regular",
            //     color: Colors.white,
            //   ),
          ),
        ),
      ),
    );
  }

  List<String> categoryListe = [
    "Petit Déjeuner",
    "Déjeuner",
    "Diner",
  ];
}
