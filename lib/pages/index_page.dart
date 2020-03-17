import 'package:flutter/material.dart';
import 'package:qdd/pages/guide_page.dart';
import 'package:qdd/pages/home_page.dart';
import 'package:qdd/pages/login_page.dart';
import 'package:qdd/pages/splash_page.dart';
import 'package:qdd/utils/constant_util.dart';
import 'package:qdd/utils/package_qdd_util.dart';
import 'package:qdd/utils/storage_qdd_util.dart';

/// 首屏 就是root Page
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Widget indexPage = new Container(color: Color(0xff000000));

  @override
  void initState() {
    super.initState();
    _checkVersionForGuide();
  }

  _checkVersionForGuide() async {
    var currentVersion = await PackageQddUtil.version();
    var storageVersion = await StorageQddUtil.getString(STORAGE_VERSION);
    if (currentVersion == null || currentVersion != storageVersion) {
      //第一次启动或者版本进行更新了 ，出现引导页面
      setState(() {
        indexPage = GuidePage();
      });
    } else {
      String token = await StorageQddUtil.getString(USER_TOKEN);
      setState(() {
        //这里面判断是否登录
        if (token == null) {
          indexPage = LoginPage();
        } else {
          indexPage = HomePage();
        }
      });

      //启动启动页及广告页面
//      setState(() {
//        indexPage = SplashPage();
//        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: indexPage,
    );
  }
}
