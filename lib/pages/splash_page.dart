import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qdd/pages/home_page.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/routes.dart';
import 'package:splashscreen/splashscreen.dart';

/// 欢迎页面
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _countNum = 3;
  Timer _countTimer;

  @override
  void initState() {
    super.initState();
//    _countTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//      setState(() {
//        if (_countNum <= 0) {
//          _countTimer.cancel();
//          Application.router.navigateTo(context, Routes.home, replace: true);
//        } else {
//          _countNum -= 1;
//        }
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomePage(),
      title: Text(
        "我是启动广告屏页面3秒后跳转",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
//      image: Image.network(
//          "https://flutter.io/images/catalog-widget-placeholder.png"),
//      gradientBackground: LinearGradient(
//          colors: [Colors.cyan, Colors.blue],
//          begin: Alignment.topLeft,
//          end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: () {
        print("ceshi");
      },
      loaderColor: Colors.transparent,
    );
  }
}

//class AfterSplash extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Welcome In SplashScreen Package"),
//        automaticallyImplyLeading: false,
//      ),
//      body: Center(
//        child: Text(
//          "Succeeded!",
//          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
//        ),
//      ),
//    );
//  }
//}
