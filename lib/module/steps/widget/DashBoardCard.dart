// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class DashBoardCard extends StatefulWidget {
//   DashBoardCard({
//     this.steps,
//     this.miles,
//     this.calories,
//     this.duration,
//     this.totalCal,
//   });
//
//   int? steps;
//   double? miles, calories, duration;
//   int? totalCal;
//
//
//   @override
//   State<DashBoardCard> createState() => _DashBoardCardState();
// }
//
// class _DashBoardCardState extends State<DashBoardCard>{
//   int? age;
//   int? weight;
//   int? height;
//
//   double target = 0;
//   getUserDataFromFirebase() async {
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//     try {
//       await FirebaseFirestore.instance
//           .collection("UserInfo")
//           .doc(userId)
//           .get()
//           .then((value) => {
//                 age = value["age"],
//                 weight = value["weight"],
//                 height = value["height"],
//               });
//       setState(() {
//         getTargetFun();
//         age;
//         weight;
//         height;
//       });
//     } catch (e) {}
//   }
//
//   getTargetFun() async {
//     setState(() {});
//     target = await ((((weight! * 10) + (height! * 6.25) + (age! * 5) + 5) * 1.2));
//     setState(() {
//       target;
//     });
//   }
//
//   @override
//   initState() {
//     getUserDataFromFirebase();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset(
//           "asset/steps/undraw_Random_thoughts_re_cob6 (1).png",
//           width: 300,
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         Card(
//           elevation: 30,
//           shape: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(60),
//             borderSide: BorderSide.none,
//           ),
//           child: Container(
//             height: 200,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.blueGrey,
//               border: Border.all(
//                 color: Colors.green,
//                 width: 0,
//               ),
//               borderRadius: BorderRadius.circular(60.0),
//             ),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     widget.steps.toString(),
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 40,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 17),
//                     child: (age == null || weight == null || height == null)
//                         ? const Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.teal,
//                             ),
//                           )
//                         : Text(
//                             "/${(((widget.totalCal! - target) / 0.0566) <= 0? 0: (widget.totalCal! - target) / 0.0566).toStringAsFixed(0)}",
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 20.0,
//         ),
//         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//           Container(
//             height: 150,
//             width: 90,
//             decoration: BoxDecoration(
//               color: Colors.blueGrey,
//               border: Border.all(color: Colors.green, width: 1),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     "asset/steps/locations.png",
//                     width: 40,
//                   ),
//                 ),
//                 Text(widget.miles!.toStringAsFixed(2),
//                     style: GoogleFonts.aBeeZee(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                         letterSpacing: 2)),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Miles",
//                       style: GoogleFonts.aBeeZee(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         letterSpacing: 2,
//                       )),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 150,
//             width: 90,
//             decoration: BoxDecoration(
//               color: Colors.blueGrey,
//               border: Border.all(color: Colors.green, width: 1),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     "asset/steps/calories.png",
//                     width: 50,
//                   ),
//                 ),
//                 Text(
//                   widget.calories!.toStringAsFixed(2),
//                   style: GoogleFonts.aBeeZee(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                       letterSpacing: 2),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Text("Calories",
//                       style: GoogleFonts.aBeeZee(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           letterSpacing: 2)),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 150,
//             width: 90,
//             decoration: BoxDecoration(
//               color: Colors.blueGrey,
//               border: Border.all(color: Colors.green, width: 1),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     "asset/steps/stopwatch.png",
//                     width: 50,
//                   ),
//                 ),
//                 Text(widget.duration!.toStringAsFixed(2),
//                     style: GoogleFonts.aBeeZee(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                         letterSpacing: 2)),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Text("Duration",
//                       style: GoogleFonts.aBeeZee(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           letterSpacing: 2)),
//                 ),
//               ],
//             ),
//           ),
//         ]),
//       ],
//     );
//   }
// }
