import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:qdd/model/Person.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/routes.dart';
import 'package:qdd/utils/fluro_conver_util.dart';

/// 钱多多整个项目的导航
class NavigatorQdd {
  /// 返回
  static void goBack(BuildContext context) {
    /// 其实这边调用的是 Navigator.pop(context);
    Application.router.pop(context);
  }

  /// 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  /// 跳转到主页面
  static void goIndexPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home,
        replace: true, transition: TransitionType.fadeIn);
  }

  //跳转到无参数页面
  static void goTestPage(BuildContext context ){
    Application.router.navigateTo(context, Routes.test,transition: TransitionType.inFromRight);
  }

  static void goTest2Page(BuildContext context ,  String  name , int  age , double score , bool sex , Person person  ){
    String personjson = FluroConvertUtils.object2string(person);
    Application.router.navigateTo(context, Routes.test2 + "?name=${name}&age=${age}&score=${score}&sex=${sex}&personjson=${personjson}", transition:  TransitionType.inFromRight);
  }


//  /// 跳转到 传参demo 页面
//  static void goDemoParamsPage(BuildContext context, String name, int age,
//      double score, bool sex, Person person) {
//    /// 对中文进行编码
//    String mName = FluroConvertUtils.fluroCnParamsEncode(name);
//
//    /// 对自定义类型 转为 json string
//    String personJson = FluroConvertUtils.object2string(person);
//    Application.router.navigateTo(
//        context,
//        Routes.demoParams +
//            "?name=${mName}&age=${age}&score=${score}&sex=${sex}&personjson=${personJson}");
//  }
//
//  /// 跳转到 会返回参数的 页面
//  static Future goReturnParamsPage(BuildContext context) {
//    return Application.router.navigateTo(context, Routes.returnParams);
//  }
//
//  /// 跳转到 转场动画 页面 ， 这边只展示 inFromLeft ，剩下的自己去尝试下，
//  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
//  static Future gotransitionDemoPage(BuildContext context, String title) {
//    return Application.router.navigateTo(
//        context,
//        Routes.transitionDemo + "?title=${title}",
//        transition: TransitionType.cupertino
//    );
//  }
//
//  /// 自定义 转场动画
//  static Future gotransitionCustomDemoPage(BuildContext context, String title) {
//    var transition = (BuildContext context, Animation<double> animation,
//        Animation<double> secondaryAnimation, Widget child) {
//      return new ScaleTransition(
//        scale: animation,
//        child: new RotationTransition(
//          turns: animation,
//          child: child,
//        ),
//      );
//    };
//    return Application.router.navigateTo(
//        context, Routes.transitionCustomDemo + "?title=$title",
//        transition: TransitionType.custom, /// 指定是自定义动画
//        transitionBuilder: transition, /// 自定义的动画
//        transitionDuration: const Duration(milliseconds: 600)); /// 时间
//  }

}
