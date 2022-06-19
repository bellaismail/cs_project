

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () {
            final width = MediaQuery
                .of(context)
                .size
                .width;
            final height = MediaQuery
                .of(context)
                .size
                .height;
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'About',
          style: TextStyle(
            color: Colors.green,
            fontSize: 25.0,
            fontFamily: "Cairo",
          ),
        ),

      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Image(
              image: AssetImage('asset/images/about.png'),
              height: 400,
              width: 300,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
              child: Text(
                'The aim of building this application is to achieve the general integrity of the community and encourage people to maintain their weight or reduce their weight for obese people to prevent many diseases.',
                style: TextStyle(color: Colors.black.withOpacity(0.6),
                    fontSize: 16,),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
              child: Text(
                'Food Calorie assessment application is suitable for all ages and helps the owners of obesity and thinness and also helps the physically fit to maintain their body in the best possible way without the need to visit a specialist dietitian and also without the need for the gym.',
                style: TextStyle(color: Colors.black.withOpacity(0.6),
                    fontSize: 16,),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
              child: Text(
                'The application tracks a user’s whole day consumption of food and accordingly determines the food suggestions based on his proteins, fats, and carbs intake.',
                style: TextStyle(color: Colors.black.withOpacity(0.6),
                    fontSize: 16),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                'The main goal of building the application is to try to improve public health with the latest technological methods and in the least possible time where everyone with a mobile in 5 minutes can know their BMI and know the number of calories suitable for him. ',
                style: TextStyle(color: Colors.black.withOpacity(0.6),
                    fontSize: 16),
              ),
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(8,8,8,2),
          //     child: Text(
          //       'Food calorie application is subject provides a means for keeping a check on a person''s daily eating habits by providing calorie intake information as well as the food suggestions and timely food reminders of what a person can consume as per his current physical parameters like height, weight, age, and his current intake of proteins fats and carbs which he can use to maintain a nutritional balance.  ',
          //       style: TextStyle(color: Colors.black.withOpacity(0.6),
          //           fontSize: 16),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

}
