
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:path/path.dart';
import 'package:untitled6/module/bmi/bmi_screen.dart';
import 'package:untitled6/module/calories/calories_screen.dart';
import 'package:untitled6/module/home/home_page.dart';
import 'package:untitled6/module/setting/setting_screen.dart';
import 'package:untitled6/module/sports/sport_screen.dart';

import 'package:untitled6/shared/cubit/states.dart';


class NewsCubit extends Cubit<NewsStates>{

  // var context;

  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context)=>BlocProvider.of(context);
  double age=18.0;

  int currentIndex=0;
  List<BottomNavigationBarItem>bottomNavigationBarItem=[
    BottomNavigationBarItem(
      icon: Icon(Icons.view_compact_outlined,),
      label: 'home',

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate,),
      label: 'Bmi',

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fastfood_outlined,),
      label: 'Calories',

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.directions_run_outlined,),
      label: 'Sports',

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings,),
      label: 'setting',

    ),
  ];
  List<Widget>screen=[
    DailyScreen(),
    BMICalculatorScreen() ,
    CaloriesScreen(),
    SportScreen(),
    SettingScreen(),


  ];
  void changeBottomNavigationBar(index){
    currentIndex=index;
    emit(NewsBottomNavStates());
  }
  void changeSufiux(){

    emit(PasswordStates());
  }
  void changeAge(){

    emit(ChangeAge());
  }}

//  Widget itemBuldier({
//     required Text text,
//    required AssetImage image,
//    required int calory,
//
// }){
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Row(
//         children: [
//           InkWell(
//             onTap: (){
//               showModalBottomSheet(
//                   context:this.context,
//                   builder: (context) {
//                     return Container(margin: const EdgeInsets.only(bottom: 20.0),
//                       padding: EdgeInsets.all(10),
//                       color: Colors.grey[200],
//                       child: text,);
//                   });
//
//             },
//             child: Ink(
//               height: 100,
//               width: 100,
//               padding: EdgeInsets.all(2),
//               decoration:  BoxDecoration(
//                 //border:BorderRadiusDirectional.all(20.0) ,
//                 // borderRadius: BorderRadiusDirectional.circular(20.0),
//                 image: DecorationImage(
//                   image: image,
//                 //  AssetImage("asset/image/073.jpg",),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 10.0,),
//           Container(
//             height: 40.0,
//             width: 140.0,
//             color: Colors.grey[300],
//             margin: const EdgeInsets.only(bottom: 0.0),
//             padding: EdgeInsets.all(10),
//             child: Text(
//               ' calories= ${calory*count}',
//               maxLines: 2,
//               overflow:  TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 overflow: TextOverflow.ellipsis,
//
//
//               ),
//             ),
//           ),
//           Expanded(
//             child: FloatingActionButton(onPressed: (){
//               emit(ChangeFloatMin());
//                 count--;
//
//             },
//               child: Icon(Icons.remove,),
//               mini: true,
//               hoverColor: Colors.teal,
//               backgroundColor: Colors.teal,
//               foregroundColor:Colors.white  ,
//               focusElevation: 80.0,
//               splashColor: Colors.white,
//               heroTag: Text('count min'),
//             ),
//           ),
//           Text('${count}',style: TextStyle(fontSize: 25.0),),
//           Expanded(
//             child: FloatingActionButton(onPressed: (){
//               emit(ChangeFloatPlus());
//                 count++;
//
//             },
//               child: Icon(Icons.add,),
//               mini: true,
//               hoverColor: Colors.teal,
//               backgroundColor: Colors.teal,
//               foregroundColor:Colors.white  ,
//               focusElevation: 80.0,
//               splashColor: Colors.white,
//               heroTag: Text('count add'),
//             ),
//           ),
//
//         ],),
//     );
//   }
 //          // ElevatedButton(
 //          //
 //          //   onPressed: ()
 //          //   {
 //          //     showModalBottomSheet(
 //          //         context: context,
 //          //         builder: (context) {
 //          //           return Container(color: Colors.red,);
 //          //         }).
 //          //     then((value){}
 //          //
 //          //     );
 //          //   }, child: Stack(
 //          //   alignment: AlignmentDirectional.bottomEnd,
 //          //   children: [
 //          //
 //          //     // showMaterialModalBottomSheet(
 //          //     //    context: context,
 //          //     //    builder: (context) => Container(),
 //          //     //  ),
 //          //     CircleAvatar(
 //          //       radius: 30.0,
 //          //       backgroundImage: AssetImage("asset/image/073.jpg",),
 //          //     ),
 //          //   ],
 //          // )
 //          //
 //          // ),
 //          // Stack(
 //          //   alignment: AlignmentDirectional.bottomEnd,
 //          //   children: [
 //          //
 //          //    // showMaterialModalBottomSheet(
 //          //    //    context: context,
 //          //    //    builder: (context) => Container(),
 //          //    //  ),
 //          //     CircleAvatar(
 //          //       radius: 30.0,
 //          //       backgroundImage: AssetImage("asset/image/073.jpg",),
 //          //     ),
 //          //   ],
 //          // ),
 //          SizedBox(width: 10.0,),
 //          Container(
 //            height: 40.0,
 //            width: 140.0,
 //            color: Colors.grey[300],
 //            margin: const EdgeInsets.only(bottom: 0.0),
 //            padding: EdgeInsets.all(10),
 //            child: Text(
 //              ' calories= ${calory*count}',
 //              maxLines: 2,
 //              overflow:  TextOverflow.ellipsis,
 //              style: TextStyle(
 //                fontWeight: FontWeight.bold,
 //                overflow: TextOverflow.ellipsis,
 //
 //
 //              ),
 //            ),
 //          ),
 //          Expanded(
 //            child: FloatingActionButton(onPressed: (){
 //              setState(() {
 //                count--;
 //              });
 //            },
 //              child: Icon(Icons.remove,),
 //              mini: true,
 //              hoverColor: Colors.teal,
 //              backgroundColor: Colors.teal,
 //              foregroundColor:Colors.white  ,
 //              focusElevation: 80.0,
 //              splashColor: Colors.white,
 //              heroTag: Text('count min'),
 //            ),
 //          ),
 //          Text('${count}',style: TextStyle(fontSize: 25.0),),
 //          Expanded(
 //            child: FloatingActionButton(onPressed: (){
 //              setState(() {
 //                count++;
 //              });
 //            },
 //              child: Icon(Icons.add,),
 //              mini: true,
 //              hoverColor: Colors.teal,
 //              backgroundColor: Colors.teal,
 //              foregroundColor:Colors.white  ,
 //              focusElevation: 80.0,
 //              splashColor: Colors.white,
 //              heroTag: Text('count add'),
 //            ),
 //          ),
 //        ],
 //      ),
 //    );
 //
 // }
