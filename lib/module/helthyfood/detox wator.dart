import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WaterSecoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Water Detox',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Apple, Lemon, Carrot Ornge ',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'is a citrus fruit rich in vitamin C, which helps detoxify the body and protects against colds.As for apples, it is said that eating one apple a day keeps you from visiting the doctor, as it contains fiber, vitamins and iron.As for carrots, it is rich in vitamin A, which helps to strengthen eyesight, and gives the skin freshness and radiance.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Cucumber, lemon, mint ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Lemon in this recipe is excellent for strengthening the immune system in the body and expelling harmful toxins. Cucumber is anti-inflammatory and helps keep the body hydrated. Mint sweetens the recipe without using sugar and helps digestion, to prepare this'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/3.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Apple, Cinnamon Stick ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'A delicious and excellent drink to lose weight and rid the body of toxins.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Pineapple , sugar cane ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Pineapple and sugar cane would be ideal, pineapple is one of the fruits that helps rid the body of toxins.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/5.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Kiwi, Orange ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Orange and kiwi are very useful for losing weight and burning fat.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/6.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Cranberry and mint ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Cranberry expels all unwanted impurities from the body, while mint acts as a cleanser that purifies the stomach, which makes this detox an effective and healthy way to lose weight..'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/7.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Lemon and ginger ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'It is known that lemon helps in promoting healthy digestion, filtering the body and slimming, but with the addition of ginger, the drink becomes more efficient and effective thanks to the properties of ginger that combat nausea and promote intestinal health, as it fights the formation of cancer cells.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/8.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients:Raspberry and orange ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Berries and oranges are natural effective ingredients in detox and weight loss, and this water will certainly be delicious in taste and with a strong effect thanks to the antioxidant properties of berries, and the feature of detoxifying the body available in citrus fruits such as oranges.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/9.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: strawberry  ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'It helps us enjoy beautiful skin, as it is full of vitamins and anti-inflammatory.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/10.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Watermelon with mint  ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Healthy and perfect for fitness enthusiasts Watermelon contains lycopene which acts as a powerful antioxidant and is also known to enhance anti-inflammatory effects.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/11.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients:pineapple and ginger ',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'A refreshing drink, low in calories, useful for those who drink water a little, the fruit in it will encourage you to drink water'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/12.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients:Parsley with lemon',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Parsley and lemon help improve digestion, and are one of the best remedies for acid gases that lead to heartburn.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/13.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Orange, berries',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'Both oranges and berries contain vitamin C, which is an essential component in strengthening the body is defenses and resistance to disease, and is also easy to digest thanks to its perfect combination of water and fiber.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/14.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Lemon , orange',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'It is low in calories and contains pectin, a fiber that increases satiety. Maintaining the freshness of the skin.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/water/15.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ingredients: Cucumber,strawberry',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          'It helps us enjoy beautiful skin, as it is full of vitamins and anti-inflammatory.'),
                                    ],
                                    //repeatForever: true,
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
