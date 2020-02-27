import 'package:connectivity/connectivity.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:qdd/model/Person.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/navigator_qdd.dart';
import 'package:qdd/routes/routes.dart';
import 'package:qdd/utils/connectivity_qdd_util.dart';
import 'package:qdd/utils/device_info_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  var  _subscription ;

  @override
  void initState() {
    super.initState();
    _checkNetWork();
  }

  /// 检测网络信号
  void _checkNetWork() async {
    String network = await ConnectivityQddUtil.getNetWork();
    if (network == "wifi") {
      //todo
    } else if (network == "mobile") {
      // todo
    } else {
      print("没有网络信号");
    }
  }

  @override
  void dispose() {
//    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            FlatButton(
              child: Text("测试页面自适应的屏幕"),
              onPressed: () {
                Application.router.navigateTo(context, Routes.test,
                    transition: TransitionType.fadeIn);
              },
            ),
            FlatButton(
              child: Text("测试本地缓存"),
              onPressed: () {
                NavigatorQdd.goTest2Page(context, "test", 1, 1.1, true,
                    Person(name: 'Zeking', age: 18, sex: true));
              },
            )
          ],
        ),
      ),
    );
  }
}
