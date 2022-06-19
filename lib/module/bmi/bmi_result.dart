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
          padding: const EdgeInsets.all(32),
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
                        width: 180,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          image: DecorationImage(
                            opacity: 0.9,
                            image: AssetImage("asset/bmi/fit.jpeg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ] else if(bmiModel.comments==  "You are Underweighted")...[
                      Container(
                        height: 200,
                        width: 130,
                        decoration: const BoxDecoration(

                          color: Colors.white24,
                          image: DecorationImage(
                            image: AssetImage("asset/bmi/uww.jpeg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ]else if(bmiModel.comments==  "You are Overweighted")...[
                      Container(
                        height: 200,
                        width: 130,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          image: DecorationImage(
                            image: AssetImage("asset/bmi/obeas.jpeg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ]else if(bmiModel.comments==  "You are Obesed")...[
                      Container(
                        height: 200,
                        width: 190,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          image: DecorationImage(
                            image: AssetImage("asset/bmi/obeas.jpeg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:BorderRadius.all(Radius.circular(5.0)),

                        ),
                      ),
                    ]
                  ],
                ),
              ),

              SizedBox(
                height: 8,
              ),
              Text("Your BMI is ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.green[700], fontSize: 34, fontWeight: FontWeight.w700),),
              Text("${bmiModel.comments}", style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

              SizedBox(height: 16,),

              bmiModel.isNormal ?
              Text("Good! Your BMI is Normal.", style: TextStyle(color: Colors.green[500], fontSize: 18, fontWeight: FontWeight.w700),)
                  :
              Text("Sadly! Your BMI is not Normal.", style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),),
              SizedBox(height: 16,),

              Container(
                padding: const EdgeInsets.all(8.0),
                margin:const EdgeInsets.all(6.0) ,
                width: double.infinity,
                height: 60.0,
                child: FlatButton.icon(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: Text("LET CALCULATE AGAIN",style: TextStyle(fontSize: 16),),
                  textColor: Colors.white,
                  color: Colors.green,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ) ,

                ),

              )

            ],
          ),
        )
    );
  }
}

