import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/admin_connexion_page.dart';
import 'package:food_app/user/screen/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:food_app/color/my_colors.dart';
import 'package:food_app/user/screen/creat_acount.dart';
import 'package:food_app/user/screen/scaffold_messanger.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
// ------------------------------
  bool isVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final TextEditingController _addresseEmail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool circleProcessing = false;
  late String _userID;
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
                    "Connexion",
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
                                  hintText: "exemple123@gmail.com",
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontFamily: "Metamorphous-Regular",
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty ||
                                      value.isValidEmail() == false) {
                                    SnackBarMessanger.showSnackBar(
                                      _scaffoldKey,
                                      "Votre Email n'est pas valide",
                                      Colors.red,
                                    );
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _addresseEmail.text = value!;
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
                              "Vous n'avez de compte ?",
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
                                          const CreatAcountPage(),
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
                          : GestureDetector(
                              onLongPress: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Text(
                                          "Êtes vous Admin ?",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "NON",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.mainColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AdminConnexionPage(),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "OUI",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.textColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
                              },
                              onTap: saveLogin,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
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
                                  child: const Center(
                                    child: Text(
                                      "Se Connecter",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      // : ValidatorButton(
                      //     text: "Se Connecter",
                      //     textStyle: const TextStyle(
                      //       letterSpacing: 1,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ),
                      //     color: Colors.deepOrange,
                      //     function: () {
                      //       saveLogin();
                      //     },
                      //   ),
                    ],
                  ),
                ),
                // ************************
                // ************************
                // ----------------------- Ou  ----------------
                // ************************
                // ************************
                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Divider(thickness: 1, color: AppColors.iconColor),
                        ),
                      ),
                      Text(
                        "Ou continuer avec ",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Divider(thickness: 1, color: AppColors.iconColor),
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
                    : Padding(
                        padding:
                            const EdgeInsets.only(right: 15, left: 15, top: 2),
                        child: InkWell(
                          onTap: signInWithGoogle,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.iconColor),
                            ),
                            child: Image.asset(
                              "assets/images/g.png",
                              width: 60,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ********************* Connexion avec Google *************
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() async {
      _userID = FirebaseAuth.instance.currentUser!.uid;
      // print(googleAuth);
      // print(FirebaseAuth.instance.currentUser!.uid);
      // print(googleUser);
      // print(googleUser!.id);
      // print(googleAuth);
      await userCollection.doc(_userID).set({
        'id': _userID,
        'name': googleUser!.displayName,
        'email': googleUser.email,
        'profileImageUrl': googleUser.photoUrl,
      }).then(
        (value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
      );
    });
  }

// ********************* Connexion avec Google *************

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
              email: _addresseEmail.text,
              password: _password.text,
            )
            .then(
              (value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ),
            );
// ************* Effacer les données ****************
        // _formKey.currentState!.reset();
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
