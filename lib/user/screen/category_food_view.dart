import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/compoments/data_food.dart';
import 'package:food_app/user/screen/food_detail_view.dart';

class FoodCategoryView extends StatefulWidget {
  const FoodCategoryView({super.key});

  @override
  State<FoodCategoryView> createState() => _FoodCategoryViewState();
}

class _FoodCategoryViewState extends State<FoodCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: listfood.length,
          itemBuilder: (context, index) {
            var list = listfood[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FoodDetailView(foodindex: list);
                }));
              },
              child: Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      offset: Offset(1, 2),
                      color: Colors.grey,
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        list.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list.title,
                              style: const TextStyle(
                                letterSpacing: 1,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Gloock-Regular",
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              list.description,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Sora-VariableFont_wght",
                                color: Colors.black54,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Expanded(
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0, 1),
                                      color: Colors.grey,
                                      blurRadius: 2,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "${list.price} F",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Sora-VariableFont_wght",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: list.isFavorite
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  list.isFavorite = !list.isFavorite;
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 25,
                                color: AppColors.iconColor,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  list.isFavorite = !list.isFavorite;
                                });
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                size: 25,
                                color: AppColors.iconColor,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )

          // PageView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: categoryList.length,
          //     onPageChanged: (index) {
          //       setState(() {
          //         currentIndex = index;
          //       });
          //     },
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: ListView.builder(
          //           itemCount: listfood.length,
          //           itemBuilder: (context, index) {
          //             var list = listfood[index];
          //             return Card(
          //               child: ListTile(
          //                 title: Text(
          //                   list.title,
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          //       );
          //     }),
          ),
    );
  }
}
