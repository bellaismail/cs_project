import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:untitled6/shared/block_observar.dart';
import 'package:untitled6/shared/network/remote/dio_helper.dart';
import 'package:untitled6/test.dart';
import 'layout/calory_app.dart';
import 'module/bmi/bmi_screen.dart';
import 'module/helthyfood/helthy.dart';
import 'module/home/home_page.dart';
import 'module/login/login_screen.dart';
import 'module/restorant/restorant.dart';
import 'module/stepcount/stepcounter.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'layout/todo_lay_out/home_lay_out.dart';

//import 'package:flutter_services_binding/flutter_services_binding.dart';
//import 'shared/block_observar.dart;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final storage = await HydratedStorage.build(
//     storageDirectory: await getApplicationDocumentsDirectory(),
//   );
//
//   HydratedBlocOverrides.runZoned(() => runApp(MyApp(
//
//     )),
//     storage: storage,
//     blocObserver: MyBlocObserver(),
//   );
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  // FlutterServicesBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      DioHelper.init();
      // Use cubits...
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool currentUser;
    if(FirebaseAuth.instance.currentUser == null){
      currentUser = false;
    }else{
      currentUser = true;
    }
    return MaterialApp(
      theme: ThemeData(
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   backgroundColor: Colors.deepOrange,
        // ),
        scaffoldBackgroundColor: Colors.white,
        // appBarTheme: AppBarTheme(
        //   backwardsCompatibility: false,
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.green,
        //     statusBarBrightness: Brightness.dark,
        //   ),
        //   titleTextStyle: TextStyle(
        //     color: Colors.white,
        //     fontSize: 25.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   backgroundColor: Colors.green,
        //   elevation: 0.0,
        //   iconTheme:IconThemeData(
        //     color: Colors.white,
        //   ),
        // ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: (currentUser == true)?const CaloLayout():LoginScreen(),
    );
  }
}
