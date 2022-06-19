import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:untitled6/layout/calory_app.dart';
import 'package:untitled6/module/register/register.dart';
import 'package:untitled6/shared/cubit/cubit.dart';
import 'package:untitled6/shared/cubit/states.dart';

//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../home/home_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  visiabilePasswordEye() {
    if (passwordIcon == Icons.visibility_off_sharp) {
      passwordIcon = Icons.visibility_rounded;
      passwordObscure = false;
    } else {
      passwordIcon = Icons.visibility_off_sharp;
      passwordObscure = true;
    }
  }

  String? email;

  String? password;

  IconData passwordIcon = Icons.visibility_off_sharp;

  TextEditingController textFieldControlPass = TextEditingController();

  TextEditingController textFieldControlEmail = TextEditingController();

  var passwordObscure = true;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  SnackBar snackBar(error) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text("$error!"),
      duration: const Duration(seconds: 3),
    );
  }

  bool spinner = false;

  loginFun(context)async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      if(this.formkey.currentState!.validate()){
        try{
          setState(() {
            spinner = true;
          });
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: "$email", password: "$password");
          setState(() {
            spinner = false;
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (builder) => const CaloLayout(),
            ),
          );
        }on FirebaseAuthException catch(e){
          setState(() {
            spinner = false;
          });
          if(e.code == "user-not-found"){
            ScaffoldMessenger.of(context).showSnackBar(snackBar("Email Not Founded"),);
          }else if(e.code == "wrong-password"){
            ScaffoldMessenger.of(context).showSnackBar(snackBar("Email Not Founded"),);
          }else if(e.code == "invalid-email"){
            ScaffoldMessenger.of(context).showSnackBar(snackBar("Wrong Email format"),);
          }
        }catch(e){
          setState(() {
            spinner = false;
          });
          print("*/**/**/**/**/**/**/${e.runtimeType}*/*/*/*/*/*/*/*/*/*/*/*/*");
          // ScaffoldMessenger.of(context).showSnackBar(snackBar("some thing wrong"),);
        }
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(snackBar("check you connection!"));
    }
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
            // appBar: AppBar(
            //   elevation: 0.0,
            //   systemOverlayStyle: const SystemUiOverlayStyle(
            //     statusBarColor: Colors.white,
            //     statusBarBrightness: Brightness.dark,
            //   ),
            //   backgroundColor: Colors.white,
            //   actions: [
            //     MaterialButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => const CaloLayout(),
            //           ),
            //         );
            //       },
            //       child: const Text(
            //         'skip',
            //         style: TextStyle(
            //           color: Colors.green,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            body: ModalProgressHUD(
              inAsyncCall: spinner,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('asset/image/logo.png'),
                            height: 350,
                            width: 500,
                          ),
                          const SizedBox(
                            height: 00.0,
                          ),
                          TextFormField(
                            controller: textFieldControlEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                // color:on,
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
                                  // color: Colors.white,
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
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
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
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
                                  visiabilePasswordEye();
                                },
                                icon: Icon(
                                  passwordIcon,
                                  color: passwordObscure == true
                                      ? Colors.grey
                                      : Colors.green,
                                  //  color: Colors.cyan[600],
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(6.0),
                            width: double.infinity,
                            height: 60.0,
                            child: ElevatedButton(
                              onPressed: () async {
                                await loginFun(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "LOGIN".toUpperCase(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const Text('Forgot your password ?'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
