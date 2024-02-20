import 'package:flutter/material.dart';

import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/food_categorie_screen.dart';
import 'package:food_app/user/screen/panier_view.dart';
import 'package:food_app/user/screen/profile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ***************
  int currentPage = 0;
  int currentIndex = 0;

  List<Widget> body = [
    const FoodHomeScreen(),
    const Center(
      child: Text("Favoris"),
    ),
    const ProfileView(),
    const PanierView(),
  ];
  // ***************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body[currentIndex],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              // blurStyle: BlurStyle.solid,
              offset: Offset(2, 10),
              // color: Colors.grey.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: -10,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            backgroundColor: Colors.blue,

            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            iconSize: 30,
            // backgroundColor: AppColors.mainColor,
            // elevation: 1,
            selectedLabelStyle: const TextStyle(
              color: Colors.black,
            ),
            selectedItemColor: AppColors.secondaryColor,
            unselectedItemColor: AppColors.iconColor,
            items: const [
              BottomNavigationBarItem(
                label: "Menu",
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: "Favoris",
                icon: Icon(
                  Icons.favorite,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(
                  Icons.person,
                ),
              ),
              BottomNavigationBarItem(
                label: "Panier",
                icon: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
