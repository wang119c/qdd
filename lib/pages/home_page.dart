import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/routes.dart';
import 'package:qdd/utils/device_info_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    DeviceInfoUtil.getDeviceInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            FlatButton(
              child: Text("跳转到测试页面"),
              onPressed: (){
                Application.router.navigateTo(context,Routes.test,transition: TransitionType.fadeIn) ;
              },
            )
          ],
        ),
      ),
    );
  }
}
