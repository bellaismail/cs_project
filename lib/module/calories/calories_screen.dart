import 'package:flutter/material.dart';
class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'CaloriesScreen',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}