import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:qdd/pages/find_pwd_next_page.dart';
import 'package:qdd/pages/find_pwd_page.dart';
import 'package:qdd/pages/home_page.dart';
import 'package:qdd/pages/index_page.dart';
import 'package:qdd/pages/login_page.dart';
import 'package:qdd/pages/reg_page.dart';
import 'package:qdd/pages/test2_page.dart';
import 'package:qdd/pages/test_page.dart';
import 'package:qdd/utils/fluro_conver_util.dart';

///跳转到首页
Handler splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

/// 跳转到主页
Handler homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

/// 跳转到登录
Handler loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

/// 跳转到注册
Handler regHandler = new Handler(
  handlerFunc: (BuildContext context , Map<String , List<String>> params) {
    return RegPage() ;
  }
);

/// 跳转到找回密码
Handler findPwdHandler = new Handler(
  handlerFunc: (BuildContext context , Map<String , List<String>> params){
    return FindPwdPage();
  }
 );

/// 跳转到找回密码下一步
Handler findPwdNextHandler = new Handler(
   handlerFunc: (BuildContext context , Map<String , List<String>> params){
     return FindPwdNextPage();
   }
);


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
