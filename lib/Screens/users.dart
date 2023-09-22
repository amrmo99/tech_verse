// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:session7test/Components/Users_items.dart';
import 'package:session7test/Models/users_model.dart';
import 'package:session7test/Screens/DetailsScreen%20.dart';
import 'package:session7test/Screens/simpleUser.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});
  List<UsersModel> user = [
    UsersModel(num: "1", name: "Mario Ashraf", phone: "01277075054"),
    UsersModel(num: "2", name: "Islam Hassan", phone: "01148801380"),
    UsersModel(num: "3", name: "Mariam Wael", phone: "01142928498"),
    UsersModel(num: "4", name: "Karol hany", phone: "01272441031"),
    UsersModel(num: "5", name: "Mira Refat", phone: "01202940526"),
    UsersModel(num: "6", name: "Marina Emad", phone: "01276363180"),
    UsersModel(num: "7", name: "Mariam Bassem", phone: "01281275623"),
    UsersModel(num: "8", name: "Kyrillos Ayman", phone: "01226972893"),
    UsersModel(num: "9", name: "Omar Khaled", phone: "01096079923"),
    UsersModel(num: "10", name: "Marina Adel", phone: "01206035153"),
    UsersModel(num: "11", name: "Yassa Adel", phone: "0102383837"),
    UsersModel(num: "12", name: "Yassmin Saliman", phone: "0183737"),
    UsersModel(num: "13", name: "Nour Mohamed", phone: "01206035153"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Top Ten",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Image.asset(
              "images/top-10.png",
            ),
          )
        ],
      ),
      body: Column(
        children:[
        Text("dd")
        ]
        
      ),
    );
  }

  Widget getA(String n) {
    return Text("data");
  }
}
