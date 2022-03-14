import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled6/module/home/home_page.dart';
import 'breakfast/breakfast.dart';
import 'dinner/dinner.dart';
import 'lunch/lunch.dart';

class HealthyScreen extends StatelessWidget {
  const HealthyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int countData=15;
    var device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder:(context) =>DailyScreen(),
            ),);
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.green,),
        ),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: Text('HealthyFood',style: TextStyle(color:Colors.green),),

      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
              margin:  const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(8.0),

            child: Column(
              children: [
                InkWell(
                  child: Container(

                      height: 230,
                      width: double.infinity,
                      decoration:  const BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black,
                        image: DecorationImage(
                          opacity: 0.7,
                            image: NetworkImage('https://simply-delicious-food.com/wp-content/uploads/2018/10/breakfast-board.jpg'),
                            // image: AssetImage("asset/image/breakfast.jpg"),
                            fit: BoxFit.cover,
                        ),


                      ),
                    child: Center(
                      child: Text('BreakFast',
                        style: TextStyle(fontSize: 40.0,

                        color: Colors.white),
                      ),
                    ),

                    // Foreground widget here
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => BreakFastScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.0,),
                InkWell(
                  child: Container(
                    height:230,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.black,
                      image: DecorationImage(
                        opacity: 0.8,
                          image: NetworkImage('https://sethlui.com/wp-content/uploads/2020/11/Christmas-2020-home-dining-online-little-farms-1.jpg'),
                          // image: AssetImage("asset/image/073.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Center(child: Text('Lunch',
                      style: TextStyle(fontSize: 40.0,

                          color: Colors.white),
                    )),
                    // Foreground widget here
                  ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => LunchScreen(),
                        ),
                      );
                    },
                ),
                SizedBox(height: 10.0,),
                InkWell(
                  child: Container(
                    height: 230,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.black,
                      image: DecorationImage(
                        opacity: 0.7,
                          // image: AssetImage("asset/image/dinner.jpg"),
                          image:NetworkImage('https://www.chowhound.com/a/img/resize/56859f073cdebf13afc4aa1f6445ae5c75094453/2019/06/last-minute-dinner-party-ideas-chowhound-670x501.jpg?fit=bounds&width=800'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(child: Text('Dinner',
                      style: TextStyle(fontSize: 40.0,

                          color: Colors.white),
                    )),
                    // Foreground widget here
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => DinnerScreen(),
                      ),
                    );

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}