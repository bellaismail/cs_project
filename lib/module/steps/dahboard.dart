import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/module/steps/widget/DashBoardCard.dart';
import 'package:untitled6/module/steps/widget/topTextButton.dart';
import 'package:provider/provider.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  //dahboard
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  int steps = 0;
  int? totalSteps;

  double previousDistance = 0.0;
  double distance = 0.0;

  int totalCal = 0;

  String userId = FirebaseAuth.instance.currentUser!.uid;

  getTotalCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      totalCal = preferences.getInt("totalCount$userId")??0;
    });
  }

  Future<void> saveSteps() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    SharedPreferences save = await SharedPreferences.getInstance();
    save.setInt("${userId}steps", steps);
  }

  Future<void> getSteps() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    SharedPreferences save = await SharedPreferences.getInstance();
    setState(() {
      steps = save.getInt("${userId}steps") ?? 0;
    });
  }



  //dashBoard
  int? age;
  int? weight;
  int? height;

  String? gender;
  double target = 0;

  getUserDataFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      await FirebaseFirestore.instance
          .collection("UserInfo")
          .doc(userId)
          .get()
          .then((value) => {
        age = value["age"],
        weight = value["weight"],
        height = value["height"],
        gender = value["gender"],
      });
      setState(() {
        getTargetFun();
        age;
        weight;
        height;
      });
    } catch (e) {}
  }

  getTargetFun() async {
    setState(() {});

    double bmi;
    bmi = weight! / ((height! / 100) * (height! / 100));
    double completeTarget = 0;

    if (bmi < 18.5) {
      completeTarget = 500;
    } else if (bmi >= 18.5 && bmi <= 25) {
      completeTarget = completeTarget;
    } else if (bmi > 25 && bmi < 30) {
      completeTarget = 400 * -1;
    } else if(bmi >= 30){
      completeTarget = 700 * -1;
    }


    if(gender == "male"){
     target = await ((((weight! * 9.99) + (height! * 6.25) + (age! * 4.92) + 5) * 1.2)) + completeTarget;
    }else if(gender == "female"){
     target = await ((((weight! * 9.99) + (height! * 6.25) + (age! * 4.92) - 161) * 1.2)) + completeTarget;
    }else{
      target = await ((((weight! * 9.99) + (height! * 6.25) + (age! * 4.92) + 5) * 1.2)) + completeTarget;
    }
    setState(() {
      target;
    });
  }

  saveDay()async{
    int currentDay = DateTime.now().day;
    int? day;
    var pre = await SharedPreferences.getInstance();
    day = pre.getInt("currentDay") == null ? 1 : pre.getInt("currentDay")!;
    if(day != currentDay){
      pre.clear();
      pre.setInt("currentDay", currentDay);
    }
  }


  @override
  initState() {
    //dahboard
    getSteps();
    getTotalCount();

    //dashboard
    getUserDataFromFirebase();
    saveDay();
    super.initState();
  }

  @override
  void dispose() {
    saveSteps();
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
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: topText("Calories", false, () {},),
                      ),
                      topText("$totalCal", true, () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: topText(
                          "Target",
                          true,
                              () {},
                          visi: false,
                        ),
                      ),
                      topText(target.toStringAsFixed(0), true, () {}, visi: true)
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "asset/steps/undraw_Random_thoughts_re_cob6 (1).png",
                        width: 300,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Card(
                        elevation: 30,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: BorderSide.none,
                        ),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            border: Border.all(
                              color: Colors.green,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  steps.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 17),
                                  child: (age == null || weight == null || height == null)
                                      ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.teal,
                                    ),
                                  )
                                      : Text(
                                    "/${(((totalCal - target) / 0.0566) <= 0? 1000: (totalCal - target) / 0.0566).toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        Container(
                          height: 150,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            border: Border.all(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "asset/steps/locations.png",
                                  width: 40,
                                ),
                              ),
                              Text(miles.toStringAsFixed(2),
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      letterSpacing: 2)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("KM",
                                    style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      letterSpacing: 2,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            border: Border.all(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "asset/steps/calories.png",
                                  width: 50,
                                ),
                              ),
                              Text(
                                calories.toStringAsFixed(2),
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    letterSpacing: 2),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text("Calories",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        letterSpacing: 2)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            border: Border.all(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "asset/steps/stopwatch.png",
                                  width: 50,
                                ),
                              ),
                              Text(duration.toStringAsFixed(2),
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      letterSpacing: 2)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text("Duration",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        letterSpacing: 2)),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
    // double milesValue = (2.2 * steps) / 5280;
    double milesValue = steps * 0.00071022727;
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
