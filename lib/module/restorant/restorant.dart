import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled6/module/helthyfood/helthy.dart';
import 'package:untitled6/module/home/home_page.dart';

import 'itemsDetaials/item_details.dart';

class RestorentScreen extends StatefulWidget {
  const RestorentScreen({Key? key}) : super(key: key);

  @override
  State<RestorentScreen> createState() => _RestorentScreenState();
}

class _RestorentScreenState extends State<RestorentScreen> {
  int count = 1;
  int calory = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
          'RestaurantFood',
          style: TextStyle(color: Colors.green, fontFamily: "Cairo"),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TopRowNavigator(
                    text: "Healthy Food",
                    icon: Icons.food_bank,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HealthyScreen(),
                        ),
                      );
                    }),
                TopRowNavigator(
                    text: "Fruits",
                    icon: Icons.food_bank,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetails(collectionName: "Fruit", pageName: "Fruits"),
                        ),
                      );
                    }),
                TopRowNavigator(
                    text: "Vegetables",
                    icon: Icons.food_bank,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetails(collectionName: "Vegetables", pageName: "Vegetables"),
                        ),
                      );
                    }),
                TopRowNavigator(
                    text: "Market",
                    icon: Icons.add_shopping_cart_rounded,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetails(collectionName: "market", pageName: "Market"),
                        ),
                      );
                    }),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      RestaurantContainers(
                        text: "Mc Donald's",
                        imagePath: "mac.jpg",
                        onPressedFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetails(
                                  pageName: "Mc Donald\'s",
                                  collectionName: "McDonald's"),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      RestaurantContainers(
                        text: "KFC",
                        imagePath: "kfc.png",
                        onPressedFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ItemDetails(pageName: "KFC", collectionName: "KFC"),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      RestaurantContainers(
                        text: "Pizza Hut",
                        imagePath: "pizzaHut.jpg",
                        onPressedFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetails(
                                  pageName: "Pizza Hut", collectionName: "Pizza Hut"),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      RestaurantContainers(
                        text: "Burger King",
                        imagePath: "BurgerKing.jpg",
                        onPressedFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetails(
                                  pageName: "Burger King",
                                  collectionName: "Burger King"),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      RestaurantContainers(
                        text: "Buffalo Burger",
                        imagePath: "buffaloBurger.jpg",
                        onPressedFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetails(
                                  pageName: "Buffalo Burger",
                                  collectionName: "Buffalo Burger"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantContainers extends StatelessWidget {
  const RestaurantContainers(
      {Key? key, this.text, this.imagePath, this.onPressedFun})
      : super(key: key);

  final String? text;
  final String? imagePath;
  final VoidCallback? onPressedFun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 230,
        width: double.infinity,
        margin: const EdgeInsetsDirectional.only(
          top: 10.0,
          start: 30.0,
          end: 30.0,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage("asset/restaurant/$imagePath"),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Center(
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 40.0, color: Colors.white),
          ),
        ),

        // Foreground widget here
      ),
      onTap: () {
        onPressedFun!();
      },
    );
  }
}

class TopRowNavigator extends StatelessWidget {
  const TopRowNavigator({Key? key, this.text, this.icon, this.onPressed}) : super(key: key);

  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10.0,
        start: 10.0,
        end: 10.0,
        bottom: 10.0,
      ),
      child: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Row(
          children: [
            Text(
              text!,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "Cairo",
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
            Icon(icon!, color: Colors.green,),
          ],
        ),
      ),
    );
  }
}
