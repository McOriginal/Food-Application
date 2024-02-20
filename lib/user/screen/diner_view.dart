import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/food_detail_view.dart';

class DinerView extends StatefulWidget {
  const DinerView({super.key});

  @override
  State<DinerView> createState() => DinerViewState();
}

class DinerViewState extends State<DinerView> {
  // ***************************
  bool isFavorite = false;
  final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
      .collection('produits')
      .where('category', isEqualTo: 'Diner')
      .snapshots();

  // ***************************
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _productsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Quelque chose c'est mal passé",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Gloock-Regular",
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text(
                      "Connecxion non disponible",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Gloock-Regular",
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.iconColor,
                    ),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "Oupss...! il n y a aucun élément dans la liste",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Gloock-Regular",
                        color: Colors.black,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FoodDetailView(
                              foodindex: snapshot.data!.docs[index]);
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
                              child: Image(
                                image: NetworkImage(
                                  snapshot.data!.docs[index]["produitImages"]
                                      [0],
                                ),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["produitName"],
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
                                      snapshot.data!.docs[index]
                                          ["produitDescription"],
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
                                            snapshot.data!
                                                    .docs[index]["produitPrice"]
                                                    .toString() +
                                                (" F"),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  "Sora-VariableFont_wght",
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
                              child: isFavorite
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isFavorite = !isFavorite;
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
                                          isFavorite = !isFavorite;
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
