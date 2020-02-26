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
  int _countNum = 3;
  Timer _countTimer;

  @override
  void initState() {
    super.initState();
    _countTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countNum <= 0) {
          _countTimer.cancel();
          Application.router.navigateTo(context, Routes.home, replace: true);
        } else {
          _countNum -= 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("测试启动页面${_countNum}"),
      ),
    );
  }
}
