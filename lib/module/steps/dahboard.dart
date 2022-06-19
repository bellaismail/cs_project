import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/module/steps/widget/DashBoardCard.dart';
import 'package:untitled6/module/steps/widget/topTextButton.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  int steps = 0;

  double previousDistance = 0.0;
  double distance = 0.0;

  int totalCal = 0;

  String userId = FirebaseAuth.instance.currentUser!.uid;

  var platform = const MethodChannel("stepsCounter/project");

  fun()async{
    try{
      await platform.invokeMethod("stepCountFun", steps);
    }on PlatformException catch(e){
      print(e.message);
    }
  }


  getTotalCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      totalCal = preferences.getInt("totalCount$userId")!;
    });
  }

  @override
  initState() {
    getTotalCount();
    super.initState();
  }

  @override
  void dispose() {
    fun();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            x = snapshot.data!.x;
            y = snapshot.data!.y;
            z = snapshot.data!.z;
            distance = getValue(x, y, z);
            if (distance > 11.5) {
              steps++;
            }
            calories = calculateCalories(steps);
            duration = calculateDuration(steps);
            miles = calculateMiles(steps);
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 56.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: topText("Calories", false, () {})),
                      topText("$totalCal", true, () {}),
                    ],
                  ),
                  DashBoardCard(
                    steps: steps,
                    calories: calories,
                    miles: miles,
                    duration: duration,
                    totalCal: totalCal,
                  ),
                  //const dailyAverage(),
                ],
              ),
            ),
          );
        },
      ),
      //bottomNavigationBar: const buttonNav(),
    );
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistance;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }
}
