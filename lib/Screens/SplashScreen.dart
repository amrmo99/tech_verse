import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:session7test/Screens/LoginScreen.dart';
import 'package:session7test/Screens/signup.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffeff4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Tech.png',
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "TECHVERSE",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(0xff0a4570),
                  fontWeight: FontWeight.bold),
            ),
            Text("Your Venture into the realm ",style: TextStyle(color: Color(0xff0a4570),fontSize: 18,),),
            Text("of future technology ", style: TextStyle(color: Color(0xff0a4570),fontSize: 18,),),
          ],
        ),
      ),
    );
  }
}
