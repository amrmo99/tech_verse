import 'package:flutter/material.dart';
import 'package:session7test/Screens/BlogsScreen.dart';
import 'package:session7test/Screens/Community.dart';
import 'package:session7test/Screens/LoginScreen.dart';
import 'package:session7test/Screens/NavBar.dart';
import 'package:session7test/Screens/RegisterScreen.dart';
import 'package:session7test/Screens/ShopScreen.dart';
import 'package:session7test/Screens/SplashScreen.dart';
import 'package:session7test/Screens/signup.dart';
import 'package:session7test/Screens/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: Colors.blue),
      ),
      home: Splash(),
      
    );
  }
}
