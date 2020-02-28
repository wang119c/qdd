import 'dart:async';

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
  StreamSubscription<ConnectivityResult> _subscription;

  @override
  void initState() {
    super.initState();


    /// 检测网络信号
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        print("mobile");
      } else if (result == ConnectivityResult.wifi) {
        print("wifi");
      }
    });





  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("测试页面自适应的屏幕"),
              onPressed: () {
                Application.router.navigateTo(context, Routes.test,
                    transition: TransitionType.fadeIn);
              },
            ),
            FlatButton(
              child: Text("测试本地缓存/传值/事件广播"),
              onPressed: () {
                NavigatorQdd.goTest2Page(context, "test", 1, 1.1, true,
                    Person(name: 'Zeking', age: 18, sex: true));
              },
            )
          ],
        ),
    );
  }
}
