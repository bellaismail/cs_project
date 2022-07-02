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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Remove Account',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Text(
                              'Do you really want to remove your account?'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                var userId =
                                    FirebaseAuth.instance.currentUser!.uid;
                                try {
                                  setState(() {
                                    spinner = true;
                                  });

                                  //to delete account from auth
                                  FirebaseAuth.instance.currentUser!
                                      .delete();

                                  //to delete fields
                                  FirebaseFirestore.instance
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

                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    spinner = false;
                                  });
                                  print(
                                      "**********************/${e.code}/***********************");
                                }
                              },
                              child: const Text('Yes'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "Remove Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Cairo",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.green),
                          ),
                          content: const Text('Do you really want to Logout?'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                            ElevatedButton(
                              onPressed: () async{
                                Navigator.pop(context);
                                setState(() {
                                  spinner = true;
                                });
                                await FirebaseAuth.instance
                                    .signOut()
                                    .then((value) => {
                                          print("*************** logout ************"),
                                        });
                                setState(() {
                                  spinner = false;
                                });
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text('confirm'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "Logout",
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
            ],
          ),
        ),
      ),
    );
  }
}
