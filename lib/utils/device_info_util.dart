import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfoUtil {
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//      print(iosInfo.name)  ;
      print(iosInfo.name);
      print(iosInfo.systemName);
      print(iosInfo.systemVersion);
      print(iosInfo.model);
      print(iosInfo.localizedModel);
      print(iosInfo.identifierForVendor);
      print(iosInfo.isPhysicalDevice);
      print(iosInfo.utsname.sysname);
      print(iosInfo.utsname.nodename);
      print(iosInfo.utsname.release);
      print(iosInfo.utsname.version);
      print(iosInfo.utsname.machine);
    }
  }
}
