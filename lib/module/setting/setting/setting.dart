// import packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../login/login_screen.dart';
import '../about/about.dart';
import '../personal/personal.dart';

class Setting extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Setting> {


  bool showTimer = false;
  int time = 10;
  bool stop = false;

  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.green,
            fontSize: 25,
            fontFamily: "Cairo",
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Container(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo"),
                  ),
                ],
              ),
              const Divider(
                height: 15,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "Cairo",
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PersonalInfo()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(6.0),
                  height: 60.0,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {

                      var userId = FirebaseAuth.instance.currentUser!.uid;

                      setState(() {
                        showTimer = true;
                      });

                      mainLoop:
                        for(int i = time; time > 0; i++){
                          await Future.delayed(const Duration(seconds: 1)).then((value) {
                            setState(() {
                              time--;
                            });
                          });
                            if(time == 0){
                              try{
                                setState(() {
                                  spinner = true;
                                });
                                await FirebaseAuth.instance.currentUser!
                                    .delete();

                                await FirebaseFirestore.instance
                                    .collection("UserInfo")
                                    .doc(userId)
                                    .delete();

                                setState(() {
                                  spinner = false;
                                });

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              }on FirebaseAuthException catch(e){
                                setState(() {
                                  spinner = false;
                                });
                                print("**********************/$e/***********************");
                              }
                            }
                            else if(time != 0 && stop == true){
                              setState(() {
                                spinner = false;

                                showTimer = false;
                                time = 10;
                                stop = false;
                              });
                              break mainLoop;
                            }

                        }
                    },
                    child: const Text(
                      "Remove Account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Cairo",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'General setting',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo",
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 15,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "Cairo",
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const about()),
                        );
                      },
                      icon: const Icon(
                        Icons.info,
                        color: Colors.green,
                      )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Contact us',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "Cairo",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launch('tel:+200102095402');
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Email Customer Support',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "Cairo",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launch(
                          'mailto:pproject891@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                    },
                    icon: const Icon(
                      Icons.mail,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(6.0),
                  height: 60.0,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      try {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                        await FirebaseAuth.instance.signOut();
                      } catch (e) {
                        print("********** wrong in signout *************");
                      }
                    },
                    child: const Text(
                      "log Out",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: "Cairo",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              (showTimer)
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: TextButton(
                              child: const Text(
                                "back",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Cairo",
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  showTimer = false;
                                  stop = true;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: Colors.red,
                                )),
                            child: TextButton(
                              child: const Text(
                                "confirm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Cairo",
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  showTimer = false;
                                  time = 1;
                                });
                              },
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            height: 60,
                            width: 50,
                            padding: const EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Center(
                              child: Text(
                                "$time",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 25,
                                  fontFamily: "Cairo",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
