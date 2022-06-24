import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bmi_result.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  double _bmi = 0;
  late BMIModel _bmiModel;

  bool spinner = false;

  getDataFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("UserInfo");
    await collectionReference.doc(userId).get().then((value) => {
          _heightOfUser = value["height"].toDouble(),
          _weightOfUser = value["weight"].toDouble(),
        });
    setState(() {
      _weightOfUser;
      _heightOfUser;
    });
  }

  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    image: DecorationImage(
                      opacity: 0.9,
                      image: AssetImage("asset/bmi/homeBmi.jpeg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "BMI Calculator",
                  style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 34,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  "We care about your health",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Height (cm)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Slider(
                    min: 80.0,
                    max: 250.0,
                    onChanged: (height) {
                      setState(() {
                        _heightOfUser = height;
                      });
                    },
                    value: _heightOfUser,
                    divisions: 100,
                    activeColor: Colors.green,
                    label: _heightOfUser.toStringAsFixed(1),
                  ),
                ),
                Text(
                  "${_heightOfUser.toStringAsFixed(1)} cm",
                  style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Weight (kg)",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Slider(
                    min: 30.0,
                    max: 120.0,
                    onChanged: (height) {
                      setState(() {
                        _weightOfUser = height;
                      });
                    },
                    value: _weightOfUser,
                    divisions: 100,
                    activeColor: Colors.green,
                    label: _weightOfUser.toStringAsFixed(1),
                  ),
                ),
                Text(
                  "${_weightOfUser.toStringAsFixed(1)} kg",
                  style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(6.0),
                  width: double.infinity,
                  height: 60.0,
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        _bmi = _weightOfUser / ((_heightOfUser / 100) * (_heightOfUser / 100));

                        if (_bmi < 18.5) {
                          _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are UnderWeighted",
                          );
                        } else if (_bmi >= 18.5 && _bmi <= 25) {
                          _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: "You are Totally Fit",
                          );
                        } else if (_bmi > 25 && _bmi < 30) {
                          _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are OverWeighted",
                          );
                        } else if(_bmi >= 30){
                          _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Obesed",
                          );
                        }
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            bmiModel: _bmiModel,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite_sharp,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Cairo",
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(6.0),
                  width: double.infinity,
                  height: 60.0,
                  child: FlatButton.icon(
                    onPressed: () async {
                      String userId = FirebaseAuth.instance.currentUser!.uid;
                      try {
                        setState(() {
                          spinner = true;
                        });
                        await FirebaseFirestore.instance
                            .collection("UserInfo")
                            .doc(userId)
                            .update({
                          "height": _heightOfUser.round(),
                          "weight": _weightOfUser.round(),
                        }).then((value) => {
                                  Fluttertoast.showToast(
                                    msg: "update done",
                                    fontSize: 20,
                                    gravity: ToastGravity.TOP,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.grey,
                                    toastLength: Toast.LENGTH_SHORT,
                                  ),
                                });
                        setState(() {
                          spinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          spinner = false;
                        });
                        print("*************************${e.runtimeType}****************");
                      }
                    },
                    icon: const Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Cairo",
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BMIModel {
  double bmi;
  bool isNormal;
  String comments;

  BMIModel({
    required this.bmi,
    required this.isNormal,
    required this.comments,
  });
}
