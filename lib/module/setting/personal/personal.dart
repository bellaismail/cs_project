import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool passObscure = true;
  IconData iconData = Icons.visibility_off_rounded;
  bool inAcyncCall = false;

  String userId = FirebaseAuth.instance.currentUser!.uid;

  String? hintName;
  String? hintEmail;
  String hintPass = "***********";

  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPass = TextEditingController();

  String? nameOnChange;
  String? emailOnChange;
  String? passOnChange;

  getUserinfo() async {
    if (FirebaseAuth.instance.currentUser == null) {
      hintName = "Visitor";
      hintEmail = "visitor@yahoo.com";
    } else {
      await FirebaseFirestore.instance
          .collection("UserInfo")
          .doc(userId)
          .get()
          .then((val) => {
                if (val.exists)
                  {
                    hintName = val["name"],
                    hintEmail = val["email"],
                  }
                else
                  {
                    print(
                        "********************** something error from getUserInfo ***************")
                  }
              });
      setState(() {
        hintName;
        hintEmail;
      });
    }
  }

  updateUserName() async {
    print("*************************$userId******************************");
    try {
      setState(() {
        inAcyncCall = true;
      });
      await FirebaseFirestore.instance
          .collection("UserInfo")
          .doc(userId)
          .update({
        "name": textEditingControllerName.text != ""?textEditingControllerName.text : hintName,
        "email": FirebaseAuth.instance.currentUser!.email,
      }).then((value) => {
        textEditingControllerName.clear(),
        textEditingControllerEmail.clear(),
      });
      setState(() {
        inAcyncCall = false;
      });
    } catch (e) {
      setState(() {
        inAcyncCall = false;
      });
      print("//**************************ERROR:$e on update name fun**************************");
    }
  }

  updateUserEmail() async {
    try{
      await FirebaseAuth.instance.currentUser!.updateEmail(textEditingControllerEmail.text);
    }catch(e){
      print("//**************************ERROR:$e on update name fun**************************");
    }
  }

  @override
  initState() {
    getUserinfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Personal Information',
          style: TextStyle(
            color: Colors.green,
            fontSize: 25.0,
            fontFamily: "Cairo",
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: inAcyncCall,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              BuildTextField(
                hint: hintName,
                label: "Full Name",
                iconData: Icons.clear,
                obscure: false,
                onChangeText: nameOnChange,
                textEditingController: textEditingControllerName,
              ),
              BuildTextField(
                hint: hintEmail,
                label: "Email",
                iconData: Icons.alternate_email_rounded,
                obscure: false,
                onChangeText: emailOnChange,
                textEditingController: textEditingControllerEmail,
              ),
              BuildTextField(
                hint: hintPass,
                label: "password",
                iconData: iconData,
                obscure: passObscure,
                onChangeText: passOnChange,
                textEditingController: textEditingControllerPass,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(6.0),
                  height: 60.0,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      await updateUserEmail();
                      await updateUserName();
                      await getUserinfo();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTextField extends StatefulWidget {
  BuildTextField({
    this.hint,
    this.label,
    this.iconData,
    this.obscure,
    this.onChangeText,
    this.textEditingController,
  });

  final String? hint;
  final String? label;
  IconData? iconData;
  bool? obscure;
  String? onChangeText;
  final TextEditingController? textEditingController;

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        controller: widget.textEditingController,
        onChanged: (val) {
          widget.onChangeText = val;
          print("/////////////////////${widget.onChangeText}***************************");
        },
        onTap: (){
          setState(() {

          });
        },
        style: const TextStyle(
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
        ),
        obscureText: widget.obscure!,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          suffixIcon: widget.label != "Full Name"? Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
              onPressed: () {
                if (widget.label == "password") {
                  if (widget.obscure == true) {
                    setState(() {
                      widget.obscure = false;
                      widget.iconData = Icons.visibility;
                    });
                  } else {
                    setState(() {
                      widget.obscure = true;
                      widget.iconData = Icons.visibility_off_rounded;
                    });
                  }
                }
              },
              icon: Icon(
                widget.iconData,
                color: Colors.grey,
              ),
            ),
          ): Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: IconButton(
                onPressed: () {
                  if(widget.textEditingController != null){
                    widget.textEditingController!.clear();
                  }
                },
                icon: Icon(
                  widget.iconData,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hint,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
            fontFamily: "Cairo",
          ),
        ),
      ),
    );
  }
}
