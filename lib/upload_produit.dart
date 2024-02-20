import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:food_app/user/screen/scaffold_messanger.dart';
import 'package:path/path.dart' as path;

import 'package:food_app/color/my_colors.dart';
import 'package:food_app/validator_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadProduit extends StatefulWidget {
  const UploadProduit({super.key});

  @override
  State<UploadProduit> createState() => _UploadProduitState();
}

class _UploadProduitState extends State<UploadProduit> {
  // *******************************
  TextEditingController categoryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  bool circularProgressBar = false;
  // ###########################
  late String produitID;
  String selectedCategory = "Petit Déjeuner";
  late String produitName;
  late double produitPrice;
  late String produitDescription;
  final _picker = ImagePicker();
  List<XFile> listImage = [];
  List<String> imageUrlList = [];
// ***********************************
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
            child: Column(
              children: [
                Text(
                  "Ajouter un produit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Gloock-Regular",
                    letterSpacing: 2,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sélectionnez une catégory",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Gloock-Regular",
                                letterSpacing: 2,
                                color: AppColors.mainColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.mainColor,
                                ),
                              ),
                              child: DropdownButton(
                                  alignment: Alignment.center,
                                  borderRadius: BorderRadius.circular(10),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Gloock-Regular",
                                    letterSpacing: 1,
                                    color: AppColors.textColor,
                                  ),
                                  value: selectedCategory,
                                  items: categoryListe
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedCategory = value!;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        // #################### Food Name

                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: textInputDecoration(
                              labelText: "Nom",
                              hinText: "Entrez le nom de nourriture",
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Veuillez remplire le champ";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              produitName = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: textInputDecoration(
                              labelText: "Prix",
                              hinText: "Entrez un prix",
                              sufixText: "F CFA",
                            ),
                            validator: (value) {
                              if (value!.isValidPrice() != true) {
                                return "Veuillez Entrez un prix correcte";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              produitPrice = double.parse(value!);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: textInputDecoration(
                              labelText: "Description",
                              hinText:
                                  "Decrire ici le produit en quelques phrase ",
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Veuillez remplire le champ";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              produitDescription = value!;
                            },
                          ),
                        ),

                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 280,
                              height: 100,
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: listImage.isNotEmpty
                                      ? Colors.black
                                      : AppColors.secondaryColor,
                                ),
                                color: Colors.grey.shade200,
                              ),
                              child: showListImages(),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: selectImages,
                                  icon: Icon(
                                    Icons.image,
                                    size: 40,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      listImage = [];
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete_forever,
                                    size: 40,
                                    color: AppColors.iconColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 120,
                              child: ValidatorButton(
                                color: AppColors.mainColor,
                                text: "Annuler",
                                textStyle: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Gloock-Regular",
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                                function: cancelUpload,
                              ),
                            ),
                            circularProgressBar == true
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.green,
                                    ),
                                  )
                                : Expanded(
                                    child: ValidatorButton(
                                      color: AppColors.secondaryColor,
                                      text: "Valider",
                                      textStyle: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Gloock-Regular",
                                        letterSpacing: 2,
                                        color: Colors.white,
                                      ),
                                      function: uploadProduct,
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textInputDecoration({
    required String labelText,
    required String hinText,
    String? sufixText,
  }) {
    return InputDecoration(
      suffixText: sufixText,
      suffixStyle: const TextStyle(
        fontSize: 13,
        color: Colors.blue,
        fontFamily: "Sora-VariableFont_wght",
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColors.mainColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColors.secondaryColor,
        ),
      ),
      focusColor: AppColors.secondaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColors.secondaryColor,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
      label: Text(labelText),
      labelStyle: TextStyle(
        fontSize: 18,
        color: AppColors.textColor,
        fontFamily: "Sora-VariableFont_wght",
      ),
      hintText: hinText,
      hintStyle: const TextStyle(
        fontSize: 13,
        color: Colors.grey,
        fontFamily: "Sora-VariableFont_wght",
      ),
    );
  }

  List<String> categoryListe = [
    "Petit Déjeuner",
    "Déjeuner",
    "Diner",
  ];

  void cancelUpload() {
    formKey.currentState!.reset();
  }

//************ Upload Images in Firebase **************

  Future<void> uploadImages() async {
    setState(() {
      circularProgressBar == true;
    });
    try {
      if (formKey.currentState!.validate()) {
        if (listImage.isNotEmpty) {
          formKey.currentState!.save();
          for (var image in listImage) {
            firebase_storage.Reference reference = firebase_storage
                .FirebaseStorage.instance
                .ref("produitsImages/${path.basename(image.path)}");
            await reference.putFile(File(image.path)).whenComplete(() async {
              await reference.getDownloadURL().then((value) {
                imageUrlList.add(value);
              });
            });
          }
        } else if (listImage.isEmpty) {
          setState(() {
            circularProgressBar == false;
          });
          SnackBarMessanger.showSnackBar(
            scaffoldKey,
            "Veuillez sélectionner les images",
            Colors.red,
          );
        }
        return;
      }
    } catch (e) {
      setState(() {
        circularProgressBar == false;
      });
      SnackBarMessanger.showSnackBar(
        scaffoldKey,
        e.toString(),
        Colors.red,
      );
      print(e);
    }
  }

  // ************ Upload Data in Firebase ****************
  Future<void> uploadData() async {
    try {
      if (formKey.currentState!.validate()) {
        if (listImage.isNotEmpty) {
          formKey.currentState!.save();
          CollectionReference productRef =
              FirebaseFirestore.instance.collection("produits");
          produitID = const Uuid().v4();
          await productRef
              .doc(produitID)
              .set(({
                "adminID": FirebaseAuth.instance.currentUser!.uid,
                "produitID": produitID,
                "category": selectedCategory,
                "produitName": produitName,
                "produitPrice": produitPrice,
                "produitDescription": produitDescription,
                "produitImages": imageUrlList,
              }))
              .whenComplete(() {
            setState(() {
              circularProgressBar == false;
              imageUrlList = [];
              listImage = [];
              formKey.currentState!.reset();
              SnackBarMessanger.showSnackBar(
                scaffoldKey,
                "Produit ajouté avec succès",
                Colors.green,
              );
            });
          });

          print(produitID);
          print(produitName);
          print(produitPrice);
          print(produitDescription);
        } else if (listImage.isEmpty) {
          setState(() {
            circularProgressBar == false;
          });
          SnackBarMessanger.showSnackBar(
            scaffoldKey,
            "Veuillez sélectionner les images",
            Colors.red,
          );
        }
        return;
      }
      setState(() {
        circularProgressBar = false;
      });
    } catch (e) {
      setState(() {
        circularProgressBar = false;
      });
      print(e);
    }
    setState(() {
      circularProgressBar = false;
    });
  }

// **************** Upload Produit in On Button Click ************
  void uploadProduct() async {
    setState(() {
      circularProgressBar = true;
    });
    await uploadImages().whenComplete(
      () => uploadData().whenComplete(
        () => setState(() {
          circularProgressBar = false;
        }),
      ),
    );
  }

// **************** Selected Images **************
  showListImages() {
    if (listImage.isNotEmpty) {
      return ListView.separated(
        itemCount: listImage.length,
        itemBuilder: (context, index) {
          return Image.file(
            File(listImage[index].path),
            fit: BoxFit.cover,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            color: AppColors.mainColor,
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          "Aucune images sélectionner",
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
        ),
      );
    }
  }

  void selectImages() async {
    try {
      final select = await _picker.pickMultiImage(
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );
      setState(() {
        listImage = select;
      });
    } catch (e) {
      print(e);
    }
  }
}

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^[1-9]\d*(\.\d{1,2})?$').hasMatch(this);
  }
}
