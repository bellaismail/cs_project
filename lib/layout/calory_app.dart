import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
            body: cubit.screen[cubit.currentIndex],


            // bottomNavigationBar: PersistentTabView(
            //   context,
            //   screens: cubit.screen(),
            //   decoration: NavBarDecoration(
            //     borderRadius: BorderRadius.circular(20.0),
            //   ),
            //   items: cubit.bottomNavigationBarItem,
            //   navBarStyle: NavBarStyle.style9,
            //   // navBarHeight: 70,
            //   hideNavigationBar: false,
            // ),
          );
        },
      ),
    );
  }
}