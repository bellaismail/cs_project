import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled6/layout/calory_app.dart';

import '../../shared/getDeciveInfo.dart';

class SplashScreenHomepage extends StatefulWidget {
  var boardController = PageController();
  GetDeviceInfo deviceInfo = GetDeviceInfo();

  @override
  State<SplashScreenHomepage> createState() => _SplashScreenHomepageState();
}

class _SplashScreenHomepageState extends State<SplashScreenHomepage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final pages = List.generate(
    //   3,
    //   (index) => Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(16),
    //       color: Colors.grey.shade300,
    //     ),
    //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    //     child: Container(
    //       height: 280,
    //       child: Center(
    //         child: Text(
    //           "Page $index",
    //           style: const TextStyle(color: Colors.indigo),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    var boardController = PageController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: boardController,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 320,
                        height: 320,
                        decoration: BoxDecoration(
                          color: /*Colors.grey.shade100*/ Colors.green.shade100,
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 60,
                        child: Image.asset(
                          'asset/water/1111.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Text(
                    'Your Food',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        Text(
                          ' the program includes all types of ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('food, not just healthy food',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 320,
                        height: 320,
                        decoration: BoxDecoration(
                          color: const Color(0xff782F9B).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 60,
                        child: Image.asset(
                          'asset/water/2222.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Text(
                    'BODY HEALTHY ',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Center(
                      child: Column(
                        children: const [
                          Text(
                            '(B M I) and the programs calculate the number of steps',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'needed to burn calories..',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 320,
                        height: 320,
                        decoration: BoxDecoration(
                          color: const Color(0xff3ABABA).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 60,
                        child: Image.asset(
                          'asset/water/3333.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Text(
                    'FITNESS',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        Text(
                          ' section on exercises to facilitate the burning of calories ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'and excess and to maintain general health.',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 1),
        height: 120,
        child: Column(
          children: [
            SmoothPageIndicator(
              controller: boardController,
              count: 3/*pages.length*/,
              effect: SwapEffect(
                activeDotColor: Colors.green,
                dotColor: Colors.grey.shade400,
                dotHeight: 16,
                dotWidth: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextButton(
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Cairo",
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CaloLayout()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      // if (pages.length == 3) {
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const CaloLayout(),
                      //     ),
                      //   );
                      // }else{
                      //
                      // }
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Cairo",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
