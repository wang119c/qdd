import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_qdd_util.dart';

/// 注册页面
class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    ScreenQddUtil.init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xff7e59cb),
        body: Stack(
          children: <Widget>[_bg(), _form()],
        ));
  }

  Widget _bg() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: ScreenQddUtil.setWidth(40)),
          child: Image.asset(
            "assets/images/login_image_02.png",
            width: ScreenQddUtil.setWidth(588),
            height: ScreenQddUtil.setHeight(472),
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    );
  }

  Widget _form() {
    return Container(
      child: Column(),
    );
  }
}
