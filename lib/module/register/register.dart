import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/layout/calory_app.dart';
import 'package:untitled6/module/login/login_screen.dart';
import 'package:untitled6/shared/cubit/cubit.dart';
import 'package:untitled6/shared/cubit/states.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class  Register extends StatefulWidget {

  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? name;

  String? email;

  String? password;

  String ?password2;

  TextEditingController textFieldControlUsername = TextEditingController();

  TextEditingController textFieldControlPass = TextEditingController();

  TextEditingController textFieldControlComfirm = TextEditingController();

  TextEditingController textFieldControlEmail = TextEditingController();

  IconData passwordIcon = Icons.visibility_off_sharp;
  IconData confirmPasswordIcon = Icons.visibility_off_sharp;

  var passwordObscure = true;
  var confirmPasswordObscure = true;

  bool spinner = false;

  visiabilePasswordEye({passOrConfirmPass}) {

    if(passOrConfirmPass == "password"){
      if (passwordIcon == Icons.visibility_off_sharp) {
        passwordIcon = Icons.visibility_rounded;
        passwordObscure = false;
      } else {
        passwordIcon = Icons.visibility_off_sharp;
        passwordObscure = true;
      }
    }else{
      if (confirmPasswordIcon == Icons.visibility_off_sharp) {
        confirmPasswordIcon = Icons.visibility_rounded;
        confirmPasswordObscure = false;
      } else {
        confirmPasswordIcon = Icons.visibility_off_sharp;
        confirmPasswordObscure = true;
      }
    }

  }

  SnackBar snackBar(error){
    return SnackBar(backgroundColor: Colors.red,content: Text("$error!"),  duration: Duration(seconds: 3),);
  }

  registerFun(context)async {

    var connectivityResult = await (Connectivity().checkConnectivity());


      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        if(this._key.currentState!.validate()){
          try {
            setState(() {
              spinner = true;
            });
            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: "$email",
                password: "$password"
            );
            setState(() {
              spinner = false;
            });
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => CaloLayout (),
                  ),
                );
          } on FirebaseAuthException catch (e) {
            setState(() {
              spinner = false;
            });
            if (e.code == 'weak-password') {
              ScaffoldMessenger.of(context).showSnackBar(snackBar("Weak Password"));
            } else if (e.code == 'email-already-in-use') {
              ScaffoldMessenger.of(context).showSnackBar(snackBar("This Email Already Exist"));
            }
          } catch (e) {
            setState(() {
              spinner = false;
            });
            print(e);
          }
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(snackBar("please check your connection!"),);
      }

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:   (BuildContext context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=NewsCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.dark,
              ),

              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder:(context) =>LoginScreen(),
                  ),);
                }, icon: Icon(Icons.arrow_back_ios,color: Colors.green,),
                ),
                SizedBox(width:211,),
                MaterialButton(
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(
                      builder:(context) =>CaloLayout(),
                    ),
                    );
                  },

                  child: const Text(
                    'skip',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),

              ],
            ),
            body: ModalProgressHUD(
              inAsyncCall: spinner,
              child: ListView(
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Form(
                      key: _key,
                      child: Center(
                        child: Column(
                          children: [
                             //SizedBox(height: 40),
                            Card(
                              elevation: 0,
                              shape: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              child: Image.asset(
                                "asset/image/re.jpg",
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
                                  if (val!.length < 8) {
                                    return "name can't be less than 8 letters";
                                  }
                                  if (val.contains("*") ||
                                      val.contains("#") ||
                                      val.contains("-")) {
                                    return 'name not valid';
                                  }
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "User Name",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  prefixIcon:Icon(Icons.person,) ,
                                  suffixIcon: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Colors.grey.withOpacity(0.2),
                                      child: IconButton(
                                        icon: Icon(Icons.clear,color:Colors.grey,),
                                        onPressed: () {
                                          textFieldControlUsername.clear();
                                        },
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  focusColor: Colors.green,
                                  border: const OutlineInputBorder(
                                    borderRadius:BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),

                                    borderSide: BorderSide(
                                      // color: Colors.white,
                                      width:0,
                                      style: BorderStyle.none,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child:TextFormField(

                                controller: textFieldControlEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration:  InputDecoration(

                                  hintText: 'Email Address',
                                  hintStyle: const TextStyle(
                                  fontSize: 14,),
                                  prefixIcon:const Icon(
                                    Icons.email,
                                    // color:on,
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.alternate_email_sharp,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  focusColor: Colors.green,
                                  border:const OutlineInputBorder(
                                    borderRadius:BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),

                                    borderSide: BorderSide(
                                      // color: Colors.white,
                                      width:0,
                                      style: BorderStyle.none,

                                    ),

                                  ),

                                ),
                                onFieldSubmitted:(value){

                                  print(value);
                                } ,
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
                                    borderRadius:BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    borderSide: BorderSide(
                                      width:0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color:Colors.grey,
                                    size: 30,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeSufiux();
                                        visiabilePasswordEye(passOrConfirmPass: "password");
                                    },
                                    icon: Icon(
                                      passwordIcon,
                                      color: passwordObscure == true ?Colors.grey:Colors.teal,
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
                                controller: textFieldControlComfirm,
                                validator: (val) {
                                  if(val!.isEmpty){
                                    return "Can't be empty";
                                  }else if(val != textFieldControlPass.text){
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
                                    borderRadius:BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    borderSide: BorderSide(
                                      width:0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color:Colors.grey,
                                    size: 30,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeSufiux();
                                      visiabilePasswordEye(passOrConfirmPass: "confirmPassword");
                                    },
                                    icon: Icon(
                                      confirmPasswordIcon,
                                      color: passwordObscure == true ?Colors.grey:Colors.teal,
                                      //  color: Colors.cyan[600],
                                      size: 30,
                                    ),
                                  ),

                                ),
                              ),
                            ),
                            // Container(
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       const Text('Age',
                            //         style: TextStyle(
                            //           color:  Colors.teal,
                            //           fontSize: 20,
                            //           fontWeight:FontWeight.w500,
                            //         ),
                            //       ),
                            //       const SizedBox(
                            //         height: 2.0,
                            //       ),
                            //       Row(
                            //         crossAxisAlignment: CrossAxisAlignment.baseline,
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         textBaseline: TextBaseline.alphabetic,
                            //         children: [
                            //           Text('${cubit.age}',
                            //             style: const TextStyle(
                            //               color:  Colors.teal,
                            //               fontSize: 20,
                            //               fontWeight:FontWeight.w700,
                            //             ),
                            //           ),
                            //           const Text('year',
                            //             style: TextStyle(
                            //               fontSize: 10,
                            //               fontWeight:FontWeight.w300,
                            //             ),
                            //           ),
                            //
                            //         ],
                            //       ),
                            //       Slider(
                            //         max: 110,
                            //         value:cubit.age,
                            //         min: 10,
                            //         activeColor: Colors.teal,
                            //         inactiveColor:Colors.grey ,
                            //         autofocus: false,
                            //         onChanged: (value){
                            //          // print(value.round());
                            //           cubit.changeAge();
                            //           cubit.age =value.roundToDouble();
                            //           if (kDebugMode) {
                            //             print(value.round());
                            //           }
                            //         }
                            //
                            //         ,),
                            //
                            //     ],
                            //   ),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10.0),
                            //     color: Colors.white54,
                            //   ),
                            // ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin:const EdgeInsets.all(6.0) ,
                              width: double.infinity,
                              height: 60.0,
                              child: ElevatedButton(
                                onPressed: ()async{
                                  await registerFun(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),),
                                child:const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:Text(
                                    "SIGN UP  ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                    'Already have an Account?'
                                ),
                                TextButton(onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder:(context) =>LoginScreen(),
                                  ),
                                  );
                                }, child: const Text('Sign in',
                                  style: TextStyle(color: Colors.green),
                                ),)
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
