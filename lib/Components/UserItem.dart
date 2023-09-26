import 'package:flutter/material.dart';
import 'package:session7test/Models/UserModel.dart';

class UserItem extends StatelessWidget {
  UserModel userModel;
  UserItem({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Icon(Icons.play_arrow),
              backgroundColor: Color(0xff385f98),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name!,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    userModel.phone!,
                    style: TextStyle(fontSize: 16, color: Color(0xffc64170)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
