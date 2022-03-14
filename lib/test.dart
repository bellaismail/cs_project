import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            try{
              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "belal5@yahoo.com", password: "1020304050");
            }catch(e){
              print("===============================================");
              print(e);
              print("===============================================");
            }
          },
          child: Text("signing.."),
        ),
      ),
    );
  }
}
