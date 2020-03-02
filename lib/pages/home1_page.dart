import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:qdd/config/service_url.dart';
import 'package:qdd/model/Person.dart';
import 'package:qdd/model/product_model.dart';
import 'package:qdd/pages/test3_page.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/navigator_qdd.dart';
import 'package:qdd/routes/routes.dart';
import 'package:qdd/service/http.dart';
import 'package:qdd/utils/connectivity_qdd_util.dart';
import 'package:qdd/utils/device_info_util.dart';
import 'package:qdd/utils/package_qdd_util.dart';

class Home1Page extends StatefulWidget {
  @override
  _Home1PageState createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> {
  StreamSubscription<ConnectivityResult> _subscription;

  @override
  void initState()  {
    super.initState();



//    var data = Http.get("http://www.phonegap100.com/appapi.php" , queryParameters: {
//      "a" : "getPortalList" ,
//      "catid" : 20 ,
//      "page" : 1
//    });
//    var data = Http.get(ServiceUrl.home);
//    print(data);

//    this._getProductData();

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

  void _getProductData() async {
    Map<String, dynamic> data =
        await Http.get(ServiceUrl.home, queryParameters: {"is_hot": 1});
    ProductModel hotList = ProductModel.fromJson(data);
    print(hotList.result[0].oldPrice);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          ),
          FlatButton(
            child: Text("测试加载远程html"),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Test3Page()));
            },
          ),
          FlatButton(
            child: Text("登录"),
            onPressed: () {
              NavigatorQdd.goLoginPage(context);
            },
          )
        ],
      ),
    );
  }
}
