import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/dashboard_view.dart';
import 'package:food_app/user/screen/inscription_admin.dart';
import 'package:food_app/user/screen/scaffold_messanger.dart';
import 'package:food_app/validator_button.dart';

class AdminConnexionPage extends StatefulWidget {
  const AdminConnexionPage({super.key});

  @override
  State<AdminConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<AdminConnexionPage> {
// ------------------------------
  bool isVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  // final TextEditingController _addresseEmail = TextEditingController();
  // final TextEditingController _password = TextEditingController();
  bool circleProcessing = false;
  late String emailAdmin;
  late String passwordAdmin;
  late String adminID;
// ------------------------------

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 100,
                ),
                Center(
                  child: Text(
                    "Acceder au panneau \n Admin",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Gloock-Regular",
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 15, left: 15, top: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Adresse Email",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColor,
                                    fontFamily: "Metamorphous-Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
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
                                  hintText: "exemple123@gmail.com",
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontFamily: "Metamorphous-Regular",
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    SnackBarMessanger.showSnackBar(
                                      _scaffoldKey,
                                      "Votre Email n'est pas valide",
                                      Colors.red,
                                    );
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  emailAdmin = value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 15, left: 15, top: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Mot de Passe",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColor,
                                    fontFamily: "Metamorphous-Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
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
                                      hintText: "* * * * * * *",
                                      hintStyle: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontFamily: "Metamorphous-Regular",
                                      ),
                                    ),
                                    obscureText: isVisible,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        setState(() {
                                          circleProcessing = false;
                                        });

                                        return "Votre Mot de passe n'est pas valide";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      passwordAdmin = value;
                                    },
                                  ),
                                  isVisible
                                      ? Positioned(
                                          top: 16,
                                          right: 20,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isVisible = !isVisible;
                                              });
                                            },
                                            child: Icon(
                                              Icons.visibility,
                                              size: 23,
                                              color: AppColors.iconColor,
                                            ),
                                          ),
                                        )
                                      : Positioned(
                                          top: 16,
                                          right: 20,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isVisible = !isVisible;
                                              });
                                            },
                                            child: Icon(
                                              Icons.visibility_off,
                                              size: 23,
                                              color: AppColors.iconColor,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 15, bottom: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Vous n'êtes pas admin ?",
                              style: TextStyle(
                                  fontFamily: "Sora-VariableFont_wght"),
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const InscriptionAdmin(),
                                    ));
                              },
                              child: Text(
                                "S'inscrire",
                                style: TextStyle(
                                  fontFamily: "Sora-VariableFont_wght",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      circleProcessing == true
                          ? CircularProgressIndicator(
                              color: AppColors.mainColor,
                            )
                          : ValidatorButton(
                              text: "Se Connecter",
                              textStyle: const TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              color: Colors.deepOrange,
                              function: saveLogin,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CollectionReference adminsCollection =
      FirebaseFirestore.instance.collection("admins");

  // ************* Save Connexion **************

  void saveLogin() async {
    setState(() {
      circleProcessing == true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        // final credential =
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailAdmin,
              password: passwordAdmin,
            )
            .then(
              (value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashBoardView(),
                ),
              ),
            );
// ************* Effacer les données ****************
        _formKey.currentState!.reset();
// ************* Effacer les données ****************
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            circleProcessing = false;
          });
          SnackBarMessanger.showSnackBar(
            _scaffoldKey,
            "Ce compte n'existe pas.",
            Colors.red,
          );

          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          setState(() {
            circleProcessing = false;
          });
          SnackBarMessanger.showSnackBar(
            _scaffoldKey,
            'Votre Mot de pass incorrecte.',
            Colors.red,
          );
          print('Wrong password provided for that user.');
        }
      }
    } else {
      SnackBarMessanger.showSnackBar(
        _scaffoldKey,
        'Erreur de connexion !',
        Colors.red,
      );
    }
  }

  // ************* Fin de Save Connexion **************
}
