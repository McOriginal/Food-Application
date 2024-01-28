import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/compoments/model_food.dart';
import 'package:food_app/validator_button.dart';

class FoodDetailView extends StatefulWidget {
  const FoodDetailView({super.key, required this.foodindex});
  final Food foodindex;

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      offset: Offset(-3, 4),
                      color: Colors.grey,
                      blurRadius: 10,
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      widget.foodindex.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: AppColors.iconColor,
                        ),
                      ),
                    ),
                  ),
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
                      widget.foodindex.title,
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
                          "${widget.foodindex.price} F",
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
                  widget.foodindex.description,
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
                    widget.foodindex.isFavorite
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                widget.foodindex.isFavorite =
                                    !widget.foodindex.isFavorite;
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
                                widget.foodindex.isFavorite =
                                    !widget.foodindex.isFavorite;
                              });
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              size: 25,
                              color: AppColors.iconColor,
                            ),
                          ),
                  ],
                ),
              ),
              // ##################
              // ######### Button ajouter au panier #############
              // ######### ## #############
              ValidatorButton(
                color: AppColors.secondaryColor,
                text: "Ajouter au Panier",
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontFamily: "Sora-VariableFont_wght",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                function: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
