import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/shared/cubit/cubit.dart';
import 'package:untitled6/shared/cubit/states.dart';


class CaloLayout  extends StatelessWidget {
  const CaloLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit(),
      //..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: ( context,state){},
        builder: ( context,state){
          var cubit=NewsCubit.get(context);
          return  Scaffold(

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items:cubit.bottomNavigationBarItem,
              onTap: (index){
                cubit.changeBottomNavigationBar(index);
              },

            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: (){
            //     // DioHelper.getData(url: 'v2/everything',
            //     //     query: {'country':'us',
            //     //            'category':'business' ,
            //     //            'apiKey':'64fd63236abf4ba0bf276922c13e40ec'}
            //     // ).then((value){
            //     //   print(value.data.toString());
            //     // }).catchError((error){
            //     //   print(error.toString());
            //     // });
            //   },
            //   child: Icon(Icons.add,),
            // ),
            body: cubit.screen[cubit.currentIndex],
          );
        },
      ),
    );
  }
}