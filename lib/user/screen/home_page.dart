import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/food_categorie_screen.dart';
import 'package:food_app/user/screen/panier_view.dart';

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
    const Center(
      child: Text("Profile"),
    ),
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
        elevation: 5,
        selectedLabelStyle: TextStyle(
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
    );
  }
}
