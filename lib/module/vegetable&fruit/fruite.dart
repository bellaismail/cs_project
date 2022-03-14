import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/module/home/home_page.dart';
class FruitScreen extends StatefulWidget {
  const FruitScreen({Key? key}) : super(key: key);


  @override
  State<FruitScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  int count=1;
  int calory=70;
  @override
  Widget build( context) {
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
        title: const Text('Fruits',style: TextStyle(color:Colors.green),),

      ),

      body: ListView.separated(
        itemBuilder: (BuildContext context, int index)=>Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      onTap: (){
                        showModalBottomSheet(
                            context:context,
                            builder: (context) {
                              return Container(margin: const EdgeInsets.only(bottom: 20.0),
                                padding: EdgeInsets.all(10),
                                color: Colors.grey[200],
                                child:  Text('KJFCBGNNMDFOGRJOIIRGEGIH'),);
                            });
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/image/download.jpg'),
                      ),

                    ),
                  ),
                  Text('APPLE'),
                ],
              ),
              SizedBox(width: 10.0,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius:BorderRadius.all(Radius.circular(10.0)),
                ),
                height: 40.0,
                width: 140.0,
                margin: const EdgeInsets.only(bottom: 0.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  ' calories= ${calory*count}',
                  maxLines: 2,
                  overflow:  TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,


                  ),
                ),
              ),
              FloatingActionButton(onPressed: (){
                setState(() {
                  count--;
                });
              },
                child: Icon(Icons.remove,),
                mini: true,
                hoverColor: Colors.green,
                backgroundColor: Colors.green,
                foregroundColor:Colors.white  ,
                focusElevation: 80.0,
                splashColor: Colors.white,
                heroTag: Text('cunt min-'),

              ),
              Text('${count}',style: TextStyle(fontSize: 25.0),),
              FloatingActionButton(onPressed: (){
                setState(() {
                  count++;
                });
              },
                child: Icon(Icons.add,),
                mini: true,
                hoverColor: Colors.green,
                backgroundColor: Colors.green,
                foregroundColor:Colors.white  ,
                focusElevation: 80.0,
                splashColor: Colors.white,
                heroTag: Text('count add-'),
              ),


            ],),
        ),
        separatorBuilder: (BuildContext context, int index)=>Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        itemCount: 10,
      ),
    );
  }

}