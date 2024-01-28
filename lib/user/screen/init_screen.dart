import 'package:flutter/material.dart';
import 'package:food_app/user/screen/creat_acount.dart';

class InitStateScreen extends StatefulWidget {
  const InitStateScreen({super.key});

  @override
  State<InitStateScreen> createState() => _InitStateScreenState();
}

class _InitStateScreenState extends State<InitStateScreen> {
  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  void changeScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
    ).whenComplete(() => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const CreatAcountPage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      ),
    );
  }
}
