import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled6/module/helthyfood/detox%20wator.dart';
import 'package:untitled6/module/helthyfood/healthItemDetails/healthy_item_details.dart';

class HealthyScreen extends StatelessWidget {
  const HealthyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int countData = 15;
    // var device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const DailyScreen(),
            //   ),
            // );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
        ),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'HealthyFood',
          style: TextStyle(color: Colors.green, fontFamily: "Cairo",),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HealthyFoodContainers(
                  key: key,
                  text: "BreakFast",
                  imagePath: "breakfast-board.jpg",
                  onPressedFun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HealthyItemDetails(pageName: "Break Fast", collectionName: "Breakfast"),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                HealthyFoodContainers(
                  key: key,
                  text: "Lunch",
                  imagePath: "Lunch.jpg",
                  onPressedFun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HealthyItemDetails(pageName: "Lunch", collectionName: "Lunch"),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                HealthyFoodContainers(
                  key: key,
                  text: "Dinner",
                  imagePath: "dinner1.jpg",
                  onPressedFun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HealthyItemDetails(pageName: "Dinner", collectionName: "Dinner"),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                HealthyFoodContainers(
                  key: key,
                  text: "Water",
                  imagePath: "mainWater.jpeg",
                  onPressedFun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaterSecoundScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HealthyFoodContainers extends StatelessWidget {
  const HealthyFoodContainers(
      {Key? key, this.text, this.imagePath, this.onPressedFun})
      : super(key: key);

  final String? text;
  final String? imagePath;
  final VoidCallback? onPressedFun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage("asset/healthyFood/$imagePath"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "Cairo",),
          ),
        ),
      ),
      onTap: () {
        onPressedFun!();
      },
    );
  }
}
