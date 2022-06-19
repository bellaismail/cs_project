import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const Icon(Icons.arrow_back),
            backgroundColor: Colors.green,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.green,
              ),
              title: const Text(
                "Today's Training",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Cairo",
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
                  onTap: () {
                    showModalBottomSheet<void>(
                      backgroundColor: const Color(0xff242526),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          padding: const EdgeInsetsDirectional.only(
                            top: 10.0,
                            bottom: 10.0,
                            start: 10.0,
                            end: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: "4xyTmX_OMiM",
                                    flags: const YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 28,
                                      endAt: 71,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  "Chair pose",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                        '1- Start by standing at the top of your mat, with your feet beside each other.',
                                        textStyle:
                                            TextStyle(color: Colors.white)),
                                  ],
                                  isRepeatingAnimation: false,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Fully extend both your arms above your head with your palms facing each other.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '3- Slowly, begin to bend your knees and “sit” as deeply as you can, as if you’re sitting into a chair behind you.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '4- Engage your deep abdominals. hold for at least ten deep breaths.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
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
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/sport/hh1.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                  onTap: () {
                    showModalBottomSheet<void>(
                      backgroundColor: const Color(0xff242526),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          padding: const EdgeInsetsDirectional.only(
                            top: 10.0,
                            bottom: 10.0,
                            start: 10.0,
                            end: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: "f9euDfcEJZY",
                                    flags: const YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 104,
                                      endAt: 133,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  "Crescent moon",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '1- From a kneeling position, step your left leg forward and extend your right leg all the way back.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Keep your hips square and place an emphasis on the stretch in the front of your right thigh.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '3- Raise both arms above your head, reaching up high from your chest and draw your shoulders back.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '4- Try to not yank yourself back from your lower back, but use your abdominals to keep you tight.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '5- Hold for at least ten deep breaths. repeat on the other side for an equal amount of time.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
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
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/sport/hh2.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                  onTap: () {
                    showModalBottomSheet<void>(
                      backgroundColor: const Color(0xff242526),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          padding: const EdgeInsetsDirectional.only(
                            top: 10.0,
                            bottom: 10.0,
                            start: 10.0,
                            end: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: "QVEINjrYUPU",
                                    flags: YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 4,
                                      endAt: 34,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  "Boat pose",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Lean back  and bend your knees as you lift your legs off the floor, balancing on your tailbone. If you can, straighten your legs.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '3- Engage your abdominals as you lift your hands to your sides, parallel to your legs.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '4- Make sure your back is lengthened and lift yourself into a V-shape. hold for at least ten deep breaths.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/sport/hh3.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                  onTap: () {
                    showModalBottomSheet<void>(
                      backgroundColor: const Color(0xff242526),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          padding: const EdgeInsetsDirectional.only(
                            top: 10.0,
                            bottom: 10.0,
                            start: 10.0,
                            end: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: "PPUAjosakvY",
                                    flags: YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 0,
                                      endAt: 29,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  "Three-Legged Dog",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Slowly, find your balance and lift your left leg up.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '3- Be careful to keep your hips square, do not lift your left buttock or allow your left foot to twist inward.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '4- Engage your right  leg and keep your shoulders strong.hold for at least ten deep breaths.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("asset/sport/hh4.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
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
