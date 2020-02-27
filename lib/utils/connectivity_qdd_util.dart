import 'package:connectivity/connectivity.dart';

/// 监听网络变化
class ConnectivityQddUtil {
  static Future<String> getNetWork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    String network = "";
    if (connectivityResult == ConnectivityResult.mobile) {
      network = "mobile";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      network = "wifi";
    }
    return network;
  }





}
