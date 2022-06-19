// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import 'Model_sheet.dart';
// import 'Sec_screen.dart';
//
//
// class WaterPage extends StatefulWidget {
//
//   var boardController = PageController();
//
//   @override
//   State<WaterPage> createState() => _WaterPageState();
// }
//
// class _WaterPageState extends State<WaterPage> {
//   final controller = PageController();
//   @override
//   void dispose(){
//     controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     final pages = List.generate(3,
//             (index) => Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.grey.shade300,
//           ),
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//           child: Container(
//             height: 280,
//             child: Center(
//                 child: Text(
//                   "Page $index",
//                   style: const TextStyle(color: Colors.indigo),
//                 )),
//           ),
//         ));
//     var boardController = PageController();
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.only(bottom :80),
//         child: PageView(
//           controller: boardController ,
//           children: [
//             Container(
//              child: Column(
//                children: [
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: 250,
//                    decoration: const BoxDecoration(
//                        image: DecorationImage(
//                            image: AssetImage('assets/images/1111.jpeg'),
//                            fit: BoxFit.contain)
//                    ),
//                  ),
//                  const SizedBox(
//                    height: 40.0,
//                  ),
//                  const Text(
//                      'Your Food',
//                    style: TextStyle(
//                      fontSize: 25.0,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                    ),
//                    ),
//                  const SizedBox(
//                    height: 18.0,
//                  ),
//                   Padding(
//                    padding: EdgeInsets.all(20.0),
//                    child: Column(
//                      children: const [
//                        Text(
//                          ' the program includes all types of ',
//                          style: TextStyle(
//                            fontSize: 18.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        Center(child: Padding(
//                          padding: EdgeInsets.all(20.0),
//                          child: Text('food, not just healthy food',style: TextStyle(
//                            fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)),
//                        ))
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//              ),
//             Container(
//                 child:Column(
//                   children: [
//                     Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 250,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/2222.jpeg'),
//                           fit: BoxFit.contain)),
//                 ),
//                     const SizedBox(
//                       height: 40.0,
//                     ),
//                     const Text(
//                       'BODY HEALTHY ',
//                       style: const TextStyle(
//                         fontSize: 25.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 35),
//                       child: Center(
//                         child: Column(
//                           children: [
//                             const Text(
//                               '(B M I) and the programs calculate the number of steps',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Center(child: Padding(
//                               padding:  EdgeInsets.all(20.0),
//                               child:  Text('needed to burn calories..',style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,)),
//                             ))
//                           ],
//                         ),
//                       ),
//                     ),
//               ],
//             )),
//             Container(child: Column (children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 250,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/3333.jpeg'),
//                         fit: BoxFit.contain)),
//               ),
//               const SizedBox(
//                 height: 40.0,
//               ),
//               const Text(
//                 'FITNES',
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     const Text(
//                       ' section on exercises to facilitate the burning of calories ',
//
//                       style: const TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Center(child: Padding(
//                       padding:  EdgeInsets.all(20.0),
//                       child:  Text('and excess and to maintain general health.',style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,)),
//                     ))
//                   ],
//                 ),
//               ),
//             ],)),
//           ],
//         ),
//       ),
//       bottomSheet: Container(
//         padding: const EdgeInsets.symmetric(horizontal:1),
//         height: 80,
//         child : Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: TextButton(
//                 child: const Text('SKIP'),
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> SecoundScreen()));
//                 },
//               ),
//             ),
//             Center(
//               child: SmoothPageIndicator(
//                 controller: boardController,
//                 count: pages.length,
//                 effect: CustomizableEffect(
//                   activeDotDecoration: DotDecoration(
//                     width: 32,
//                     height: 12,
//                     color: Colors.indigo,
//                     rotationAngle: 180,
//                     verticalOffset: -10,
//                     borderRadius: BorderRadius.circular(24),
//                     // dotBorder: DotBorder(
//                     //   padding: 2,
//                     //   width: 2,
//                     //   color: Colors.indigo,
//                     // ),
//                   ),
//                   dotDecoration: DotDecoration(
//                     width: 24,
//                     height: 12,
//                     color: Colors.grey,
//                     // dotBorder: DotBorder(
//                     //   padding: 2,
//                     //   width: 2,
//                     //   color: Colors.grey,
//                     // ),
//                     // borderRadius: BorderRadius.only(
//                     //     topLeft: Radius.circular(2),
//                     //     topRight: Radius.circular(16),
//                     //     bottomLeft: Radius.circular(16),
//                     //     bottomRight: Radius.circular(2)),
//                     borderRadius: BorderRadius.circular(16),
//                     verticalOffset: 0,
//                   ),
//                   spacing: 6.0,
//                   // activeColorOverride: (i) => colors[i],
//                   inActiveColorOverride: (i) => colors[i],
//                 ),
//                // count:pages.length,
//                // effect: ,
//               ),
//             ),
//            /* TextButton(
//               child: const Text('NEXT',
//               style: TextStyle(
//                 color: Colors.white,
//                 backgroundColor: Colors.green,
//               ),),
//               onPressed: () {
//                 boardController.nextPage(
//                   duration: Duration(milliseconds: 750,)
//                   ,curve:Curves.fastLinearToSlowEaseIn,);
//               },
//             ),*/
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(4),
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned.fill(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: <Color>[
//                               Color(0XFF006200),
//                               Color(0XFF008900),
//                               Color(0XFF27ff27),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         padding: const EdgeInsets.all(18.0),
//                         primary: Colors.white,
//                         textStyle: const TextStyle(fontSize: 20),
//                       ),
//                       onPressed: () {
//                         boardController.nextPage(
//                           duration: const Duration(milliseconds: 750,)
//                           ,curve:Curves.fastLinearToSlowEaseIn,);
//                       },
//                       child: const Text('NEXT'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]
//
//           ,
//         )
//         ,
//       ) ,
//
//     );
//   }
//
// }
// final colors = const [
//   Colors.lightGreenAccent,
//   Colors.green,
//   Colors.greenAccent,
//
// ];