import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'route_handler.dart';

/**
 * 路由
 */
class Routes {
  static String root = "/";
  static String home = "home";
  static String login = "login";
  static String test = "test";
  static String test2 = "test2" ;

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画
    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(test, handler: testHandler);
    router.define(test2, handler: test2Handler);
  }
}
