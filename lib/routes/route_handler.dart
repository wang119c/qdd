import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:qdd/pages/home_page.dart';
import 'package:qdd/pages/splash_page.dart';

///跳转到首页
Handler splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SplashPage();
});

/// 跳转到主页
Handler homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});
