import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.arrow_back),
            //title: Text("Today's Training"),
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
                                    initialVideoId: "pT5l2LPP3ac",
                                    flags: YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 108,
                                      endAt: 165,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  "Jump rope",
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
                                          '1- Start with feet together and arms by sides. Bend at elbows to bring forearms wide and up to hip height.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Begin making small circles with both forearms in a forward motion while simultaneously taking quick hops with feet. Perform 20 reps.',
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
                        image: AssetImage("asset/sport/car1.jpg"),
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
                                    initialVideoId: "Nnb9bXV3o0s",
                                    flags: YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 5,
                                      endAt: 30,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  "Lunges jumps",
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
                                          '1- Stand with the feet hip-width apart. extend the right leg back to a lunge position.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Push off with the right foot to lift the right knee to hip height, jumping in the air while doing so.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '3- Return the right foot to the starting position and repeat for 10 lunges on one side.repeat for the left leg.',
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
                        image: AssetImage("asset/sport/car2.jpg"),
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
                                    initialVideoId: "Fs_fiXLE_98",
                                    flags: YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 3,
                                      endAt: 12,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  "Squat to front kick",
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
                                          '1- Stand with the feet hip-width apart and arms at the sides.bend at the knees to squat down.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Return to standing and extend one leg to perform a front kick.repeat the kick on the other side.Hold for at least 15  seconds.',
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
                        image: AssetImage("asset/sport/car3.jpg"),
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
                                    initialVideoId: "VSp0z7Mp5IU",
                                    flags: YoutubePlayerFlags(
                                      hideControls: false,
                                      autoPlay: true,
                                      mute: false,
                                      startAt: 24,
                                      endAt: 81,
                                      loop: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  "Inchworms",
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
                                          '1- Start in a standing position, reach down and touch the toes briefly before walking the hands out to a pushup position.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '2- Perform a push up, then walk the feet toward the hands and lift the hips upwards. Hold for at least 30  seconds.',
                                          textStyle:
                                              TextStyle(color: Colors.white)),
                                    ],
                                    isRepeatingAnimation: false,

                                    // maxLines: 2,
                                    //repeatForever: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          '3- Inch the feet as close as possible toward the hands before walking the hands out to return to the pushup position.',
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
                        image: AssetImage("asset/sport/inn.jpg"),
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
