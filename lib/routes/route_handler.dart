import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:qdd/pages/home_page.dart';
import 'package:qdd/pages/splash_page.dart';
import 'package:qdd/pages/test2_page.dart';
import 'package:qdd/pages/test_page.dart';
import 'package:qdd/utils/fluro_conver_util.dart';

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

Handler testHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TestPage();
});

//测试带参数的跳转
Handler test2Handler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String name = params["name"]?.first;
  String age = params["age"]?.first;
  String sex = params["sex"]?.first;
  String score = params["score"]?.first;
  String personjson = params["personjson"]?.first;
  return Test2Page(
    name: name,
    age: FluroConvertUtils.string2int(age),
    sex: FluroConvertUtils.string2bool(sex),
    score: FluroConvertUtils.string2double(score),
    personJson: personjson,
  );
});
