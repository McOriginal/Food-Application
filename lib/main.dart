import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/admin_connexion_page.dart';
import 'package:food_app/upload_produit.dart';
import 'firebase_options.dart';

import 'package:food_app/user/screen/init_screen.dart';
import 'package:food_app/user/screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      home:
           AdminConnexionPage(),
          // StreamBuilder(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         print("User ID = ${FirebaseAuth.instance.currentUser!.uid}");
          //         return const HomePage();
          //       }
          //       return const InitStateScreen();
          //     }),
    );
  }
}
