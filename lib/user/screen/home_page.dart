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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        iconSize: 30,
        backgroundColor: AppColors.mainColor,
        elevation: 1,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.iconColor,
        items: [
          BottomNavigationBarItem(
            tooltip: "AAAAAAA",
            backgroundColor: Colors.white.withOpacity(0.7),
            label: "Menu",
            icon: const Icon(
              Icons.home,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Favoris",
            icon: Icon(
              Icons.favorite,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Panier",
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
    );
  }
}
