import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                child:Column(
                  children: [
                    if (bmiModel.comments == "You are Totaly Fit") ...[
                      Container(
                        height: 200,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          image: DecorationImage(
                            opacity: 0.9,
                            image: AssetImage("asset/image/fit.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ] else if(bmiModel.comments==  "You are Underweighted")...[
                      Container(
                        height: 200,
                        width: 150,
                        decoration: const BoxDecoration(

                          color: Colors.white24,
                          image: DecorationImage(
                            opacity: 0.9,
                            image: AssetImage("asset/image/unw.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ]else if(bmiModel.comments==  "You are Overweighted")...[
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          image: DecorationImage(
                            opacity: 0.9,
                            image: AssetImage("asset/image/over.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ]else if(bmiModel.comments==  "You are Obesed")...[
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          image: DecorationImage(
                            opacity: 0.9,
                            image: AssetImage("asset/image/obes.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ]
                  ],
                ),
                // decoration: const BoxDecoration(
                //   color: Colors.white24,
                //   image: DecorationImage(
                //     opacity: 0.9,
                //     image: AssetImage("asset/image/m2.png"),
                //     fit: BoxFit.fill,
                //   ),
                //   borderRadius:BorderRadius.all(Radius.circular(5.0)),
                //
                // ),
                // child: bmiModel.isNormal ? AssetImage("asset/image/baby.png", fit: BoxFit.contain,) : AssetImage("asset/image/dinner.jpg", fit: BoxFit.fill,) ,
              ),

              SizedBox(
                height: 8,
              ),
              Text("Your BMI is ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
              Text("${bmiModel.comments}", style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

              SizedBox(height: 16,),

              bmiModel.isNormal ?
              Text("Hurray! Your BMI is Normal.", style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),)
                  :
              Text("Sadly! Your BMI is not Normal.", style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),),
              SizedBox(height: 16,),

              Container(
                child: FlatButton.icon(
                  onPressed: (){

                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: Text("LET CALCULATE AGAIN"),
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        )
    );
  }
}

