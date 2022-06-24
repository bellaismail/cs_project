import 'package:flutter/material.dart';

import 'Categories_Screen.dart';

class GymScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
        title: const Text(
          "Training Fitness",
          style: TextStyle(
            color: Colors.green,
            fontFamily: "Cairo",
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: CategoriesScreen(),
    );
  }
}
