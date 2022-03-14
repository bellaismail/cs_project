import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:untitled6/module/helthyfood/helthy.dart';
import 'package:untitled6/module/login/login_screen.dart';
import 'package:untitled6/module/market/market.dart';
import 'package:untitled6/module/restorant/restorant.dart';
import 'package:untitled6/module/vegetable&fruit/fruite.dart';
import 'package:untitled6/module/vegetable&fruit/vegtable.dart';


class DailyScreen extends StatefulWidget {
  const DailyScreen({Key? key}) : super(key: key);

  @override
  _DailyScreenState createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder:(context) =>LoginScreen(),
            ),);
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.green,),
        ),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
          title: Text('HomePage',style: TextStyle(color:Colors.green),),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(2.0),
         // margin: const EdgeInsets.all(5.0) ,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),

                        child: const Opacity(
                          opacity: 0.7,
                          child: const Image(image: const AssetImage('asset/image/l1.jpeg'),
                            width:double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(

                          context,
                          MaterialPageRoute(
                            builder: (builder) => HealthyScreen(),
                          ),
                        );
                      },
                        child: const Text(
                          'Healthy Food',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),

                        child: const Opacity(
                          opacity: 0.7,
                          child: Image(image: NetworkImage('https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                            width:double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => RestorentScreen(),
                          ),
                        );
                      },
                        child: const Text(
                          'Resturants',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),

                        child: const Opacity(
                          opacity: 0.7,
                          child: const Image(
                            // image:AssetImage('asset/image/l3.jpeg'),
                            image: const NetworkImage('https://images.pexels.com/photos/1660027/pexels-photo-1660027.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                            width:double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(

                          context,
                          MaterialPageRoute(
                            builder: (builder) => VetableScreen(),
                          ),
                        );
                      },
                        child: const Text(
                          'Vegetables',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),

                        child: const Opacity(
                          opacity: 0.7,
                          child: const Image(

                             image: const NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/002/377/438/small/frame-of-fresh-fruits-free-photo.jpg'),
                            width:double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(

                          context,
                          MaterialPageRoute(
                            builder: (builder) => FruitScreen(),
                          ),
                        );
                      },
                        child: const Text(
                          'Fruits',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),

                        child: const Opacity(
                          opacity: 0.7,
                          child: const Image(image: const NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/003/312/960/small/young-man-shopping-at-supermarket-free-photo.jpg'),
                            width:double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(

                          context,
                          MaterialPageRoute(
                            builder: (builder) => MarketScreen(),
                          ),
                        );
                      },
                        child: const Text(
                          'Market',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     margin: const EdgeInsets.all(5),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         const Image(image: NetworkImage('https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
              //           width: 150,
              //           height: 150,
              //           fit: BoxFit.cover,
              //         ),
              //         const SizedBox(width: 10.0),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: const [
              //             Text('Boiled Egg Dish.',
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //             Text('Low Carb, Low Calories',
              //               style: TextStyle(
              //                 fontSize: 14.0,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Expanded(
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     margin: const EdgeInsets.all(5),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Image(image: NetworkImage('https://images.pexels.com/photos/1070053/pexels-photo-1070053.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
              //           width: 150,
              //           height: 150,
              //           fit: BoxFit.cover,
              //         ),
              //         SizedBox(width: 10.0),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text('Caeser Salad.',
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //             Text('Low Carb, Low Calories',
              //               style: TextStyle(
              //                 fontSize: 14.0,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Expanded(
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     margin: const EdgeInsets.all(5),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Image(image: NetworkImage('https://images.pexels.com/photos/1251208/pexels-photo-1251208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              //           width: 150,
              //           height: 150,
              //           fit: BoxFit.cover,
              //         ),
              //         SizedBox(width: 10.0),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text('Grilled Stick',
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //             Text('Low Carb, Low Calories',
              //               style: TextStyle(
              //                 fontSize: 14.0,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ] ,
          ),
        ),
      ),
    );
  }
}