import 'package:flutter/material.dart';
import 'package:session7test/utils/data/models/user.dart';

class UserItem extends StatelessWidget {
  final User userModel;
  const UserItem({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff385f98),
              child: Icon(Icons.play_arrow),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.firstName!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    userModel.phoneNumber!,
                    style: const TextStyle(fontSize: 16, color: Color(0xffc64170)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
