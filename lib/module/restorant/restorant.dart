import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled6/module/home/home_page.dart';
import 'package:untitled6/module/restorant/restorents/buffalo.dart';
import 'package:untitled6/module/restorant/restorents/burger_king.dart';
import 'package:untitled6/module/restorant/restorents/kfc.dart';
import 'package:untitled6/module/restorant/restorents/mac.dart';
import 'package:untitled6/module/restorant/restorents/pizza_hot.dart';
class RestorentScreen extends StatefulWidget {
  const  RestorentScreen ({Key? key}) : super(key: key);

  @override
  State< RestorentScreen> createState() => _RestorentScreenState();
}

class _RestorentScreenState extends State<RestorentScreen> {
  int count=1;
  int calory=70;
  @override
  Widget build(BuildContext context) {
    int countData=15;
    var device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder:(context) => DailyScreen(),
            ),);
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.green,),
        ),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: const Text('RestaurantFood',style: TextStyle(color:Colors.green),),

      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin:  const EdgeInsets.all(2.0),

            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InkWell(
                    child: Container  (

                      height: 230,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          opacity: 0.7,
                          image: NetworkImage('https://1.bp.blogspot.com/-HiqAE_wN-_A/YSMih5usl0I/AAAAAAAABgY/wEvTy7NAIEwHYsFUVTtp9SIHpRTA01N6ACLcBGAsYHQ/w616-h360/0b5f35806317b97eea3f27834f235aa95dc83fd1.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:BorderRadius.all(Radius.circular(10.0)),

                      ),
                      child: const Center(
                        child: Text('Mc Donald\'s',
                          textAlign: TextAlign.center,
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
                          builder: (builder) => MacScreen(),
                        ),
                      );
                    },
                  ),
                ),

                InkWell(
                  child: Container(
                    height: 230,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        opacity: 0.7,
                          image: NetworkImage("https://www.thaqfny.com/wp-content/uploads/2021/02/%D8%AF%D8%AC%D8%A7%D8%AC-%D9%83%D9%86%D8%AA%D8%A7%D9%83%D9%8A-%D9%85%D8%B4%D8%A7%D8%B1%D9%83%D8%A9.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text('Kfc',
                      style: TextStyle(fontSize: 40.0,

                          color: Colors.white),
                    )),
                    // Foreground widget here
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => KfcScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.0,),
                InkWell(
                  child: Container(
                    height:230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        opacity: 0.7,
                          image: AssetImage("asset/image/download.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child: Center(child: Text('PizzaHut',
                      style: TextStyle(fontSize: 40.0,

                          color: Colors.white),
                    )),
                    // Foreground widget here
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => PizzaHotScreen(),
                      ),
                    );

                  },
                ),
                SizedBox(height: 10.0,),
                InkWell(
                  child: Container(
                    height:230,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          opacity: 0.7,
                          image: NetworkImage("https://cloudfront-us-east-2.images.arcpublishing.com/reuters/FSSJLYFK4VKF5IRMQKUZAWAUXM.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text('BurgerKing',
                      style: TextStyle(fontSize: 40.0,

                          color: Colors.white),
                    )),
                    // Foreground widget here
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => BurgerKingScreen(),
                      ),
                    );

                  },
                ),
                SizedBox(height: 10.0,),
                InkWell(
                  child: Container(
                    height: 230,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black,
                      image: DecorationImage(
                          opacity: 0.7,
                          image: NetworkImage("https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/8515a540380111.5606da44b9f6a.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(child: Text('Buffalo burger',
                      style: TextStyle(fontSize: 40.0,

                          color: Colors.white),
                    )),
                    // Foreground widget here
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => BuffaloScreen(),
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