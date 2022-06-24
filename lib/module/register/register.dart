import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:untitled6/module/login/login_screen.dart';
import 'package:untitled6/shared/cubit/cubit.dart';
import 'package:untitled6/shared/cubit/states.dart';

import '../splashScreen/splash_home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? name;

  String? email;

  String? password;

  String? password2;

  int? age = 35;

  int? weight = 75;

  int? height = 100;

  String? gender;


  TextEditingController textFieldControlUsername = TextEditingController();

  TextEditingController textFieldControlPass = TextEditingController();

  TextEditingController textFieldControlConfirm = TextEditingController();

  TextEditingController textFieldControlEmail = TextEditingController();

  IconData passwordIcon = Icons.visibility_off_sharp;
  IconData confirmPasswordIcon = Icons.visibility_off_sharp;

  var passwordObscure = true;
  var confirmPasswordObscure = true;

  bool spinner = false;

  visiabilePasswordEye({passOrConfirmPass}) {
    if (passOrConfirmPass == "password") {
      if (passwordIcon == Icons.visibility_off_sharp) {
        passwordIcon = Icons.visibility_rounded;
        passwordObscure = false;
      } else {
        passwordIcon = Icons.visibility_off_sharp;
        passwordObscure = true;
      }
    } else {
      if (confirmPasswordIcon == Icons.visibility_off_sharp) {
        confirmPasswordIcon = Icons.visibility_rounded;
        confirmPasswordObscure = false;
      } else {
        confirmPasswordIcon = Icons.visibility_off_sharp;
        confirmPasswordObscure = true;
      }
    }
  }

  SnackBar snackBar(error) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text("$error!"),
      duration: const Duration(seconds: 3),
    );
  }

  registerFun(context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (this._key.currentState!.validate()) {
        try {
          setState(() {
            spinner = true;
          });
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: "$email", password: "$password");
          await saveUserInfo();
          setState(() {
            spinner = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (builder) => SplashScreenHomepage()/*CaloLayout()*/,
            ),
          );
        } on FirebaseAuthException catch (e) {
          setState(() {
            spinner = false;
          });
          if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBar("Weak Password"));
          } else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBar("This Email Already Exist"));
          }
        } catch (e) {
          setState(() {
            spinner = false;
          });
          print("*/**/**/**/**/**/**/${e.runtimeType}*/*/*/*/*/*/*/*/*/*/*/*/*");
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar("please check your connection!"),
      );
    }
  }

  saveUserInfo() async {
    String _authId = FirebaseAuth.instance.currentUser!.uid;
    var usersCollection = FirebaseFirestore.instance.collection("UserInfo");


    var url = "https://api.genderize.io/?name=${name!.split(" ").first}";
    var res = await http.get(Uri.parse(url));
    var body = jsonDecode(res.body);
    gender = body["gender"];


    String? category;
    if(age! < 16){
      category = "Child";
    }else if(age! >= 16 && age! < 45){
      category = "youth";
    }else{
      category = "grand";
    }

    await usersCollection.doc(_authId).set({
      "name": name,
      "email": FirebaseAuth.instance.currentUser!.email,
      "password": password,
      "age": age,
      "weight": weight,
      "height": height,
      "category": category,
      "gender": gender,
    });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: spinner,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Form(
                      key: _key,
                      child: Center(
                        child: Column(
                          children: [
                            Card(
                              elevation: 0,
                              shape: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              child: Image.asset(
                                "asset/register.jpeg",
                                width: 350,
                                height: 250,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                onChanged: (val) {
                                  name = val;
                                },
                                onSaved: (val) {
                                  name = val;
                                },
                                controller: textFieldControlUsername,
                                validator: (val) {
                                  if (val!.length < 5) {
                                    return "name can't be less than 8 letters";
                                  }
                                  if (val.contains("*") ||
                                      val.contains("#") ||
                                      val.contains("-")) {
                                    return 'name not valid';
                                  }
                                },
                                style: const TextStyle(
                                  // fontFamily: "Cairo",
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "User Name",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                  ),
                                  suffixIcon: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.2),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          textFieldControlUsername.clear();
                                        },
                                      ),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(16),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  focusColor: Colors.green,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                controller: textFieldControlEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.alternate_email_sharp,
                                  ),
                                  contentPadding: const EdgeInsets.all(16),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  focusColor: Colors.green,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
                                  // fontFamily: "Caior",
                                ),
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                onChanged: (val) {
                                  email = val;
                                },
                                onSaved: (val) {
                                  email = val;
                                },
                                validator: (val) {
                                  if (val == null) {
                                    return "email can't be empty";
                                  } else if (val != null && val.length < 8) {
                                    return "email can't be less than 8 letter";
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                onChanged: (val) {
                                  password = val;
                                },
                                onSaved: (val) {
                                  password = val;
                                },
                                controller: textFieldControlPass,
                                validator: (val) {
                                  if (val == null) {
                                    return "password can't be empty";
                                  } else if (val != null && val.length < 8) {
                                    return "password can't be less than 8 letter";
                                  }
                                },
                                obscureText: passwordObscure,
                                keyboardType: TextInputType.visiblePassword,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  focusColor: Colors.green,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeSufiux();
                                      visiabilePasswordEye(
                                          passOrConfirmPass: "password");
                                    },
                                    icon: Icon(
                                      passwordIcon,
                                      color: passwordObscure == true
                                          ? Colors.grey
                                          : Colors.teal,
                                      //  color: Colors.cyan[600],
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                onChanged: (val) {
                                  password2 = val;
                                },
                                onSaved: (val) {
                                  password2 = val;
                                },
                                controller: textFieldControlConfirm,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Can't be empty";
                                  } else if (val != textFieldControlPass.text) {
                                    return "Not The Same Password";
                                  }
                                },
                                obscureText: confirmPasswordObscure,
                                keyboardType: TextInputType.visiblePassword,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.all(16),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  focusColor: Colors.green,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeSufiux();
                                      visiabilePasswordEye(
                                          passOrConfirmPass: "confirmPassword");
                                    },
                                    icon: Icon(
                                      confirmPasswordIcon,
                                      color: confirmPasswordObscure == true
                                          ? Colors.grey
                                          : Colors.teal,
                                      //  color: Colors.cyan[600],
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 180,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.teal, width: 1)
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: NumberPicker(
                                          value: age!,
                                          minValue: 5,
                                          maxValue: 65,
                                          step: 1,
                                          haptics: true,
                                          selectedTextStyle: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                          onChanged: (val){
                                            setState(() {
                                              age = val;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        color: Colors.teal,
                                        height: 1,
                                        width: 70,
                                      ),
                                      const Text(
                                        "Age",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Cairo",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 180,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.teal, width: 1)
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: NumberPicker(
                                          value: weight!,
                                          minValue: 30,
                                          maxValue: 150,
                                          step: 1,
                                          haptics: true,
                                          selectedTextStyle: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                          onChanged: (val){
                                            setState(() {
                                              weight = val;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        color: Colors.teal,
                                        height: 1,
                                        width: 70,
                                      ),
                                      const Text(
                                        "Weight",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Cairo",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 180,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.teal, width: 1)
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: NumberPicker(
                                          value: height!,
                                          minValue: 60,
                                          maxValue: 200,
                                          step: 1,
                                          haptics: true,
                                          selectedTextStyle: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                          onChanged: (val){
                                            setState(() {
                                              height = val;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        color: Colors.teal,
                                        height: 1,
                                        width: 70,
                                      ),
                                      const Text(
                                        "Height",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Cairo",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.all(6.0),
                              width: double.infinity,
                              height: 60.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await registerFun(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "SIGN UP  ",
                                    style: TextStyle(fontSize: 20, fontFamily: "Cairo",),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have an Account?', style: TextStyle(
                                  fontFamily: "Cairo",
                                ),),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Colors.green,
                                      decoration: TextDecoration.underline,
                                      fontFamily: "Cairo",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class InfoPicker extends StatefulWidget {
  InfoPicker({
    this.text,
    this.currentValue,
    this.minVal,
    this.maxVal,
    this.saveFun,
});

  String? text;
  int? currentValue;
  int? minVal;
  int? maxVal;
  Function? saveFun;

  @override
  State<InfoPicker> createState() => _InfoPickerState();
}

class _InfoPickerState extends State<InfoPicker> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 80,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.teal, width: 1)
      ),
      child: Column(
        children: [
          Expanded(
            child: NumberPicker(
              value: widget.currentValue!,
              minValue: widget.minVal!,
              maxValue: widget.maxVal!,
              step: 1,
              haptics: true,
              selectedTextStyle: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
              onChanged: (val){
                setState(() {
                  widget.currentValue = val;
                });
              },
            ),
          ),
          Container(
            color: Colors.teal,
            height: 1,
            width: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.text!,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
