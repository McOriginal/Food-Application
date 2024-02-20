import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:food_app/color/my_colors.dart';

class FoodDetailView extends StatefulWidget {
  const FoodDetailView({super.key, required this.foodindex});
  final dynamic foodindex;

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  // *******************
  late List<dynamic> listImage = widget.foodindex["produitImages"];
  // *********************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Swiper(
                  itemCount: listImage.length,

                  itemBuilder: (BuildContext context, int index) {
                    return Image(
                      image: NetworkImage(
                        listImage[index],
                      ),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.SCALE,

                  autoplay: true,
                  autoplayDelay: 3000,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(color: Colors.white, size: 30),
                  fade: 1.0,
                  curve: Curves.easeInExpo,
                  // viewportFraction: 0.85,
                ),
              ),

              const SizedBox(height: 20),
              // ####################
              // ####################
              //########## Food Title ################
              // ####################
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.foodindex["produitName"],
                      style: const TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Gloock-Regular",
                        color: Colors.black,
                      ),
                    ),

                    // ###############
                    // ######## Food Price #################
                    // ####################
                    Container(
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
                          widget.foodindex["produitPrice"].toString() + (" F"),
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Sora-VariableFont_wght",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ########################
              // ############# Food Description #####################
              // ####################
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.foodindex["produitDescription"],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // #################
              // ####### Autres ##############""
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 20,
                          color: AppColors.iconColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "5-6 min",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ##################
              // ######### Button ajouter au panier #############
              // ######### ## #############
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.7,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Ajouter au Panier",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Sora-VariableFont_wght",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: AppColors.secondaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
