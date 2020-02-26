import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/routes.dart';

/// 欢迎页面
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer timer = new Timer(new Duration(seconds: 3), () {
      Application.router.navigateTo(context, Routes.home , replace: true);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("测试启动页面"),
      ),
    );
  }
}
