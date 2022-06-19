
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class GetDeviceInfo{
  String? deviceId;

  Future<void> getDeviceInfo()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try{
      if(Platform.isAndroid){
        var build = await deviceInfo.androidInfo;
        deviceId = build.androidId;
        print("///***///*** $deviceId ***///***///");
      }
    }catch(e){
      print("*********** ERROR FROM MAIN PAGE: it's not work with IOS platform, yet **********");
    }
  }

}