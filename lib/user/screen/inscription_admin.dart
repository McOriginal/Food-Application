import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/admin_connexion_page.dart';

import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/scaffold_messanger.dart';
import 'package:food_app/validator_button.dart';

class InscriptionAdmin extends StatefulWidget {
  const InscriptionAdmin({super.key});

  @override
  State<InscriptionAdmin> createState() => _CreatAcountState();
}

class _CreatAcountState extends State<InscriptionAdmin> {
  // ------------------********************

  bool isVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  // final TextEditingController nomAdmin = TextEditingController();
  // final TextEditingController emailAdmin = TextEditingController();
  // final TextEditingController passwordAdmin = TextEditingController();
  late String nomAdmin;
  late String emailAdmin;
  late String passwordAdmin;
  bool circleProcessing = false;
  late String _adminID;
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
                    "Créer un compte \n Admin",
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
                                  "Nom Admin",
                                  style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 2,
                                    color: AppColors.textColor,
                                    fontFamily: "Gloock-Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextFormField(
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
                                  hintText: "Entrer le nom d'administrateur",
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontFamily: "Gloock-Regular",
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
                                onChanged: (value) {
                                  nomAdmin = value;
                                },
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
                                  "Email Admin",
                                  style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 2,
                                    color: AppColors.textColor,
                                    fontFamily: "Gloock-Regular",
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
                                  hintText: "exemple@gmail.com",
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontFamily: "Gloock-Regular",
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
                                    letterSpacing: 2,
                                    color: AppColors.textColor,
                                    fontFamily: "Gloock-Regular",
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
                                        fontFamily: "Gloock-Regular",
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
                                          const AdminConnexionPage(),
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
                              function: saveNewUser,
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

  // ********************* Save user informations in Firebase *****************

  CollectionReference adminsCollection =
      FirebaseFirestore.instance.collection("admins");
  void saveNewUser() async {
    setState(() {
      circleProcessing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        // final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAdmin,
          password: passwordAdmin,
        );
        _adminID = FirebaseAuth.instance.currentUser!.uid;
        await adminsCollection.doc(_adminID).set({
          'id': _adminID,
          'nomAdmin': nomAdmin,
          'emailAdmin': emailAdmin,
          'passwordAdmin': passwordAdmin,
        }).then(
          (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminConnexionPage(),
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
        setState(() {
          circleProcessing = false;
        });
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



