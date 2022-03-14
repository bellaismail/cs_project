// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pedometer/pedometer.dart';
// class StepScreen extends StatefulWidget {
//
//   @override
//   State<StepScreen > createState() => _StepState();
// }
// class _StepState extends State<StepScreen > {
//   String muestrePasos="";
//   String _km="Unknown";
//   String _calories="Unknown";
//   String _stepCountValue="Unknown";
//   late StreamSubscription<int>_subscription;
//
//   late double _numerox;   //stepcount
//   late double _kmx;       //num kilometer
//   late double burnedx;    //cant calories burned
//
//    @override
//  void initState(){
//      super.initState();
//      setUpPedometer();
//
//    }
//    void  setUpPedometer(){
//      Pedometer pedometer=new Pedometer();
//      _subscription=Pedometer.stepCountStream.listen( _onData ,onError: _onError, onDone: _onDone,cancelOnError: true) as StreamSubscription<int>;
//    }
//    void _onDone(){}
//    void _onError(error){
//      print('flutter pedometer error:$error');
//   }
//   void _onData( stepCountValue ) {
//     print(stepCountValue);
//     setState(() {
//       _stepCountValue="$stepCountValue";
//       print(_stepCountValue);
//     });
//     var distance=stepCountValue;
//     double y=(distance +.0);//convert a double,
//     setState(() {
//       _numerox=y;
//     });
//     //we remove some decimals
//     num long3=(_numerox/100);
//     long3=num.parse(y.toStringAsFixed(4));
//     long3=(long3/1000);
//     getDistanceRun(_numerox);
//   }
//   //create function for determine the distance run in kilometer using number of step
//   void getDistanceRun(double _numerox){
//      num distance=((_numerox *78)/100000);
//      distance=num.parse(distance.toString());
//      setState(() {
//        _km="$distance";
//        print(_km);
//      });
//      setState(() {
//        _kmx=distance *30;
//      });
//   }
//   //create function for calories burned in kilometers using number of step
//   void getBurnedRun(){
//      setState(() {
//        _calories="$_km";
//        print(_calories);
//      });
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('STEP COUNT'),
//         backgroundColor: Colors.pinkAccent,
//       ),
//       body: Container(
//         color: Colors.white24,
//         child: ListView(
//           padding: EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
//           children:[
//             Container(
//               padding: EdgeInsets.only(top: 10.0),
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [Color(0xFFA9F5F2),Color(0xFF01DFD7)],
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(27.0),
//                   bottomRight:Radius.circular(27.0),
//                   topLeft: Radius.circular(27.0),
//                   topRight: Radius.circular(27.0),
//                 )),
//             ),
//           ],
//
//         ),
//       ),
//     );
//   }
//
//
// }
