import 'package:flutter/material.dart';

import 'Gym_Screen.dart';

class FitnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'GYM',
          style: TextStyle(
            color: Colors.green,
            fontFamily: "Cairo",
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Image.asset("asset/sport/15.jpg"),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GymScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Cairo",
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
