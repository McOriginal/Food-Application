import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/food_detail_view.dart';
import 'package:food_app/validator_button.dart';

class PanierView extends StatefulWidget {
  const PanierView({super.key});

  @override
  State<PanierView> createState() => _PanierViewState();
}

class _PanierViewState extends State<PanierView> {
  // **************************
  int quantity = 1;
  // **************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.grey.withOpacity(0.3),
                    //   ),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.of(context).pop();
                    //     },
                    //     child: Icon(
                    //       Icons.arrow_back,
                    //       size: 40,
                    //       color: AppColors.secondaryColor,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      "Panier",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Gloock-Regular",
                        fontSize: 23,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // #####################
                    // #####################
                    Text(
                      "5 élement",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Gloock-Regular",
                        fontSize: 18,
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // ####################### Cart Elements ###############
              // SizedBox(
              //   width: double.infinity,
              //   height: MediaQuery.of(context).size.height / 1.5,
              //   child: ListView.builder(
              //     physics: const BouncingScrollPhysics(),
              //     // itemCount: listfood.length,
              //     itemBuilder: (context, index) {
              //       // var list = listfood[index];
              //       return InkWell(
              //         onTap: () {
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) {
              //             return FoodDetailView(foodindex: list);
              //           }));
              //         },
              //         child: Container(
              //           width: double.infinity,
              //           height: 120,
              //           padding: const EdgeInsets.all(10),
              //           margin: const EdgeInsets.only(top: 5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: Colors.white,
              //             boxShadow: const [
              //               BoxShadow(
              //                 blurStyle: BlurStyle.solid,
              //                 offset: Offset(1, 2),
              //                 color: Colors.grey,
              //                 blurRadius: 3,
              //               )
              //             ],
              //           ),
              //           child: Row(
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(15),
              //                 ),
              //                 child: Image.asset(
              //                   list.image,
              //                   width: 100,
              //                   height: 100,
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         list.title,
              //                         style: const TextStyle(
              //                           letterSpacing: 1,
              //                           fontSize: 14,
              //                           fontWeight: FontWeight.bold,
              //                           fontFamily: "Gloock-Regular",
              //                           color: Colors.black,
              //                         ),
              //                       ),
              //                       const SizedBox(height: 5),
              //                       Text(
              //                         list.description,
              //                         style: const TextStyle(
              //                           fontSize: 14,
              //                           fontFamily: "Sora-VariableFont_wght",
              //                           color: Colors.black54,
              //                         ),
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,
              //                       ),
              //                       const SizedBox(height: 2),
              //                       Expanded(
              //                         child: Container(
              //                           height: 30,
              //                           width: 70,
              //                           decoration: BoxDecoration(
              //                             color: AppColors.secondaryColor,
              //                             boxShadow: const [
              //                               BoxShadow(
              //                                 blurStyle: BlurStyle.solid,
              //                                 offset: Offset(0, 1),
              //                                 color: Colors.grey,
              //                                 blurRadius: 2,
              //                               )
              //                             ],
              //                           ),
              //                           child: Center(
              //                             child: Text(
              //                               "${list.price} F",
              //                               style: const TextStyle(
              //                                 fontSize: 14,
              //                                 fontFamily:
              //                                     "Sora-VariableFont_wght",
              //                                 fontWeight: FontWeight.bold,
              //                                 color: Colors.white,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Align(
              //                   alignment: Alignment.bottomCenter,
              //                   child: Row(
              //                     children: [
              //                       // ############### Incrementation #############
              //                       IconButton(
              //                         onPressed: () {
              //                           setState(() {
              //                             quantity++;
              //                           });
              //                         },
              //                         icon: Icon(
              //                           Icons.arrow_left,
              //                           size: 25,
              //                           color: AppColors.iconColor,
              //                         ),
              //                       ),
              //                       // ###################
              //                       Text(
              //                         quantity.toString(),
              //                         style: TextStyle(
              //                           fontSize: 15,
              //                           fontWeight: FontWeight.bold,
              //                           color: AppColors.textColor,
              //                         ),
              //                       ),
              //                       // ###################

              //                       // ############# Decrementation ##############
              //                       IconButton(
              //                         onPressed: () {
              //                           quantity == 1
              //                               ? 1
              //                               : setState(() {
              //                                   quantity--;
              //                                 });
              //                         },
              //                         icon: Icon(
              //                           Icons.arrow_right,
              //                           size: 25,
              //                           color: AppColors.iconColor,
              //                         ),
              //                       ),
              //                     ],
              //                   )),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // const SizedBox(height: 15),
              // Padding(
              //   padding: const EdgeInsets.all(15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Text(
              //         "Total : ",
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontFamily: "Sora-VariableFont_wght",
              //           fontWeight: FontWeight.bold,
              //           color: AppColors.mainColor,
              //         ),
              //       ),
              //       Text(
              //         "7 500 F",
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontFamily: "Sora-VariableFont_wght",
              //           fontWeight: FontWeight.bold,
              //           color: AppColors.textColor,
              //         ),
              //       ),
              //       // ###################### Boutton ################
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: SizedBox(
              //           width: MediaQuery.of(context).size.width / 3,
              //           child: ValidatorButton(
              //             color: AppColors.secondaryColor,
              //             text: "Commander",
              //             textStyle: const TextStyle(
              //               fontSize: 15,
              //               fontFamily: "Sora-VariableFont_wght",
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //             ),
              //             function: () {},
              //           ),
              //         ),
              //       ),
              //       // ###################### Boutton ################
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
