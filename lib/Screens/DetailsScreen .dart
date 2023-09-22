import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String phone;

  DetailsScreen({required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: $name",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Phone: $phone",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
