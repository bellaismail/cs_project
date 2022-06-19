import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled6/module/helthyfood/helthy.dart';
import '../restorant/itemsDetaials/item_details.dart';
import '../restorant/restorant.dart';

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
        centerTitle: true,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'HomePage',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HomeContainer(
              text: "Healthy Food",
              imagePath: "healthyFood/Lunch.jpg",
              onPressedFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HealthyScreen(),
                  ),
                );
              },
            ),
            const SizedBox(width: 10.0),
            HomeContainer(
              text: "Restaurant",
              imagePath: "restaurant/restaurant.webp",
              onPressedFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RestorentScreen(),
                  ),
                );
              },
            ),
            const SizedBox(width: 10.0),
            HomeContainer(
              text: "Vegetables",
              imagePath: "vegetabels/vegetabel.jpeg",
              onPressedFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(
                      pageName: "Vegetables",
                      collectionName: "Vegetables",
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 10.0),
            HomeContainer(
              text: "Fruits",
              imagePath: "fruits/fruits.jpg",
              onPressedFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(
                      pageName: "Fruits",
                      collectionName: "Fruit",
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 10.0),
            HomeContainer(
              text: "Market",
              imagePath: "market/market.jpg",
              onPressedFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(
                      pageName: "Market",
                      collectionName: "market",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  // const HomeContainer({Key? key}) : super(key: key);

  HomeContainer({this.text, this.imagePath, this.onPressedFun});

  final String? text;
  final String? imagePath;
  final VoidCallback? onPressedFun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressedFun!();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 10.0,
          bottom: 5.0,
          start: 20.0,
          end: 20.0,
        ),
        child:
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.brown,
            image: DecorationImage(
              image: AssetImage('asset/$imagePath'),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
