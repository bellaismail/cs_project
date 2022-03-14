import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);


  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int count=1;
  int calory=70;
  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Market'),
        backgroundColor: Colors.teal,
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
                        backgroundImage: AssetImage('asset/image/roman.jpg'),
                      ),

                    ),
                  ),
                  Text('APPLE'),
                ],
              ),
              SizedBox(width: 10.0,),
              Container(
                height: 40.0,
                width: 140.0,
                color: Colors.grey[300],
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
                hoverColor: Colors.teal,
                backgroundColor: Colors.teal,
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
                hoverColor: Colors.teal,
                backgroundColor: Colors.teal,
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