import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HealthyItemDetails extends StatefulWidget {
  HealthyItemDetails({this.pageName, this.collectionName});

  String? pageName;
  String? collectionName;

  @override
  State<HealthyItemDetails> createState() => _HealthyItemDetailsState();
}

class _HealthyItemDetailsState extends State<HealthyItemDetails> {

  String? userCat;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  
  getUserCat()async{
    await FirebaseFirestore.instance.collection("UserInfo").doc(userId).get().then((value) => {
      userCat = value["category"],
    });
    setState(() {
      userCat;
    });
  }

  @override
  initState(){
    getUserCat();
    super.initState();
  }
  
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
        title: Text(
          '${widget.pageName}',
          style: const TextStyle(color: Colors.green, fontFamily: "Cairo"),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(widget.collectionName!)
            .where("category",isEqualTo: userCat)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || userCat == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RowSeparated(
                    snapshot: snapshot,
                    index: index,
                    pageName: widget.pageName,
                    collectionName: widget.collectionName,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Padding(
                padding:
                const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
              itemCount: snapshot.data.docs.length,
            );
          }
        },
      ),
    );
  }
}

class RowSeparated extends StatefulWidget {
  RowSeparated(
      {Key? key,
        this.snapshot,
        this.index,
        this.pageName,
        this.collectionName,
      })
      : super(key: key);

  final AsyncSnapshot? snapshot;
  final int? index;
  final String? pageName;
  String? collectionName;

  @override
  State<RowSeparated> createState() => _RowSeparatedState();
}

class _RowSeparatedState extends State<RowSeparated> {
  int countIndex = 0;
  String? userId;
  late YoutubePlayerController ytController;

  String? userCat;
  String? docCat;
  
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  getCurrentUserId()async{
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  getCount()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      countIndex = preferences.getInt("count$userId${widget.pageName}${widget.index}")!;
    });
  }

  incrementFun()async{
    setState(() {
      countIndex++;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("count$userId${widget.pageName}${widget.index}", countIndex);


    int currentMealVal = widget.snapshot!.data.docs[widget.index].data()["Calories"];
    int totalCount = preferences.getInt("totalCount$userId")??0;

    preferences.setInt("totalCount$userId", currentMealVal+totalCount);
    // preferences.setString("$year$month$day", value)
  }

  decrementFun()async{
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if(countIndex > 0){
        countIndex--;
        preferences.setInt("count$userId${widget.pageName}${widget.index}", countIndex);
        int currentMealVal = widget.snapshot!.data.docs[widget.index].data()["Calories"];
        int totalCount = preferences.getInt("totalCount$userId")??0;
        preferences.setInt("totalCount$userId", totalCount-currentMealVal);
        preferences.setString("dateTime", "${DateTime.now()}");
      }else{
        // countIndex = countIndex;
      }
    });
  }

  @override
  initState(){

    // if(DateTime.now().day == 24){
    //
    // }

    print("${DateTime.now()}");

    getCurrentUserId();
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(docCat == userCat){
      return Row(
        children: [
          GestureDetector(
            onTap: (){
              print("////////////////////${widget.snapshot!.data.docs[widget.index].data()["video"]}/////////////");
              showModalBottomSheet(
                backgroundColor: const Color(0xff242526),
                context: context,
                builder: (context) {
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
                    child:
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: "${widget.snapshot!.data.docs[widget.index].data()["video"]}",
                              flags: YoutubePlayerFlags(
                                hideControls: false,
                                autoPlay: true,
                                mute: false,
                                startAt: widget.snapshot!.data.docs[widget.index].data()["start"],
                                endAt: widget.snapshot!.data.docs[widget.index].data()["end"],
                                loop: true,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "\"${widget.snapshot!.data.docs[widget.index].data()["name"]}\"",
                            style: const TextStyle(
                              fontSize: 22,
                              color: Color(0xffF5F6F7),
                              fontWeight: FontWeight.w200,

                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "\"${widget.snapshot!.data.docs[widget.index].data()["Description"]}\"",
                            style: const TextStyle(
                              fontSize: 22,
                              color: Color(0xffF5F6F7),
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
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  image: NetworkImage(
                      widget.snapshot!.data.docs[widget.index].data()["image"]
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              // child: CircleAvatar(
              //   child: Image.network(
              //     widget.snapshot!.data.docs[widget.index].data()["image"],
              //     errorBuilder:
              //         (BuildContext context, exception, stackTrace) {
              //       return const Icon(
              //         Icons.do_not_disturb,
              //         color: Colors.grey,
              //       );
              //     },
              //   ),
              //   backgroundColor: Colors.white,
              // ),
            ),
          ),
          const Expanded(child: SizedBox(width: 10.0)),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            height: 40.0,
            width: 140.0,
            margin: const EdgeInsets.only(bottom: 0.0),
            padding: const EdgeInsets.all(10),
            child: Text(
              ' ${widget.snapshot!.data.docs[widget.index].data()["Calories"] * countIndex} Cal',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              decrementFun();
            },
            child: const Icon(
              Icons.remove,
            ),
            mini: true,
            hoverColor: Colors.green,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            focusElevation: 80.0,
            splashColor: Colors.white,
            heroTag: const Text('cunt min-'),
          ),
          Text(
            countIndex.toString(),
            style: const TextStyle(fontSize: 25.0),
          ),
          FloatingActionButton(
            onPressed: () async {
              incrementFun();
            },
            child: const Icon(
              Icons.add,
            ),
            mini: true,
            hoverColor: Colors.green,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            focusElevation: 80.0,
            splashColor: Colors.white,
            heroTag: const Text('count add-'),
          ),
        ],
      );
    }else{
     return SizedBox();
    }
    }
  }
