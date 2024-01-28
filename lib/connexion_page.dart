import 'package:flutter/material.dart';
import 'package:food_app/color/my_colors.dart';
import 'package:food_app/page_intro.dart';
import 'package:food_app/user/screen/creat_acount.dart';
import 'package:food_app/validator_button.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
// ------------------------------
  bool isVisible = true;
// ------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                hintText: "exemple123@gmail.com",
                                hintStyle: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontFamily: "Metamorphous-Regular",
                                ),
                              ),
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
                      padding:
                          const EdgeInsets.only(right: 15, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Vous n'avez de compte ?",
                            style:
                                TextStyle(fontFamily: "Sora-VariableFont_wght"),
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
                    ValidatorButton(
                      text: "Se Connecter",
                      textStyle: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      color: Colors.deepOrange,
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageIntroAnimation(),
                            ));
                      },
                    ),
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

              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 2),
                child: InkWell(
                  onTap: () {},
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
    );
  }
}
