import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/compoments/data_food.dart';
import 'package:food_app/user/screen/category_food_view.dart';

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
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special Fast Food",
                  style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Gloock-Regular",
                    color: AppColors.textColor,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Special Fast Food",
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Gloock-Regular",
                  color: AppColors.mainColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 9,
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    var cat = categoryList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // pageController.nextPage(
                          //   duration: (const Duration(microseconds: 500)),
                          //   curve: Curves.bounceInOut,
                          // );
                          currentIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
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
                          child: Center(
                            child: Text(
                              cat.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                letterSpacing: 3,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Gloock-Regular",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            // ********************* List food View ************
            const FoodCategoryView(),
          ],
        ),
      ),
    ));
  }
}
