// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:session7test/Models/users_model.dart';

class UserItem extends StatelessWidget {
  UserItem({required this.usersModel});
  UsersModel usersModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Text(
              usersModel.num!,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  usersModel.name!,
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text(
                  usersModel.phone!,
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
