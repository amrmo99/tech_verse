// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:session7test/Screens/LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "UserName",
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.person),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.email),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.lock),
                  ),
                  suffix: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.lock),
                  ),
                  suffix: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.blue,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    print('this your email : ${usernameController.text}');
                    print('this your email : ${emailController.text}');
                    print('this your email : ${passController.text}');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Login",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
