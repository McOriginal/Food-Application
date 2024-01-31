import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:food_app/color/my_colors.dart';
import 'package:food_app/connexion_page.dart';
import 'package:food_app/user/screen/home_page.dart';
import 'package:food_app/user/screen/scaffold_messanger.dart';
import 'package:food_app/validator_button.dart';

class CreatAcountPage extends StatefulWidget {
  const CreatAcountPage({super.key});

  @override
  State<CreatAcountPage> createState() => _CreatAcountState();
}

class _CreatAcountState extends State<CreatAcountPage> {
  // ------------------********************

  bool isVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final TextEditingController _nomPrenom = TextEditingController();
  final TextEditingController _addresseEmail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool circleProcessing = false;
  late String _userID;
// -------------------- *******************
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
                    "Créer un compte",
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
                                  "Prénom et Nom",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColor,
                                    fontFamily: "Metamorphous-Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _nomPrenom,
                                keyboardType: TextInputType.text,
                                maxLength: 40,
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
                                  hintText: "Votre Prénom et Nom",
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontFamily: "Metamorphous-Regular",
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    setState(() {
                                      circleProcessing = false;
                                    });
                                    return "Veuillez entrez un Nom valide";
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _nomPrenom.text = value!;
                                // },
                              ),
                            ],
                          ),
                        ),
                      ),
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
                                controller: _addresseEmail,
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
                                  hintText: "exemple@gmail.com",
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontFamily: "Metamorphous-Regular",
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty ||
                                      value.isValidEmail() == false) {
                                    setState(() {
                                      circleProcessing = false;
                                    });
                                    return "Votre Email n'est pas valide";
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _addresseEmail.text = value!;
                                // },
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
                                    controller: _password,
                                    keyboardType: TextInputType.text,
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
                                      if (value!.trim().isEmpty ||
                                          value.length < 5) {
                                        setState(() {
                                          circleProcessing = false;
                                        });

                                        return "Votre Mot de passe n'est pas valide";
                                      }
                                      return null;
                                    },
                                    // onSaved: (value) {
                                    //   _password.text = value!;
                                    // },
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
                              "Vous avez dèjà un compte",
                              style: TextStyle(
                                fontFamily: "Sora-VariableFont_wght",
                              ),
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ConnexionPage(),
                                    ));
                              },
                              child: Text(
                                "Se connecter",
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
                      const SizedBox(height: 20),
                      circleProcessing == true
                          ? CircularProgressIndicator(
                              color: AppColors.mainColor,
                            )
                          : ValidatorButton(
                              text: "S'inscrire",
                              textStyle: const TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              color: Colors.deepOrange,
                              function: () {
                                saveNewUser();
                              },
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

  // ********************* Save user informations *****************

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  void saveNewUser() async {
    setState(() {
      circleProcessing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        // final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _addresseEmail.text,
          password: _password.text,
        );
        _userID = FirebaseAuth.instance.currentUser!.uid;
        await usersCollection.doc(_userID).set({
          'id': _userID,
          'nomPrenom': _nomPrenom.text,
          'email': _addresseEmail.text,
          'password': _password.text,
        }).then(
          (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              )),
        );
// **************** Effacer les données du formulaire ***********
        _formKey.currentState!.reset();
// **************** Effacer les données du formulaire ***********
      } on FirebaseException catch (ex) {
        if (ex.code == 'weak-password') {
          setState(() {
            circleProcessing = false;
          });
          SnackBarMessanger.showSnackBar(
            _scaffoldKey,
            'Votre Mot de pass est trop court.',
            Colors.red,
          );
          print('Votre Mot de pass est trop court.');
        } else if (ex.code == 'email-already-in-use') {
          setState(() {
            circleProcessing = false;
          });
          SnackBarMessanger.showSnackBar(
            _scaffoldKey,
            'Ce compte exist déjà',
            Colors.red,
          );

          print('The account already exists for that email.');
        }
      } catch (e) {
        SnackBarMessanger.showSnackBar(
          _scaffoldKey,
          e.toString(),
          Colors.red,
        );

        print(e);
      }
    } else {
      SnackBarMessanger.showSnackBar(
        _scaffoldKey,
        "Erreur de !!!",
        Colors.red,
      );
    }
  }
}

// ********************* Fin de Save user informations *****************

// ************** Regular Expression pour validation Email ***************
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z]{2,3})$')
        .hasMatch(this);
  }
}
// ************** Regular Expression pour validation Email ***************

// ************** Regular Expression pour validation Email ***************
// extension NameValidator on String {
//   bool isValidName() {
//     return RegExp(r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)$').hasMatch(this);
//   }
// }
  // ************** Regular Expression pour validation Email ***************



