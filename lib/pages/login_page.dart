import 'package:flutter/material.dart';
import 'package:qdd/routes/navigator_qdd.dart';
import 'package:qdd/utils/screen_qdd_util.dart';
import 'package:qdd/widgets/en_text_field.dart';
import 'package:qdd/widgets/login_or_reg.dart';
import 'package:qdd/widgets/tap_button.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ScreenQddUtil.init(context);
    return Scaffold(
      backgroundColor: Color(0xff7e59cb),
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[Bg(), Form()],
      ),
    );
  }
}

/// 登录背景
class Bg extends StatefulWidget {
  @override
  _BgState createState() => _BgState();
}

class _BgState extends State<Bg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Image.asset(
            "assets/images/login_image_01.png",
            width: 132,
            height: 168,
          ),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}

/// 登录表单
class Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  bool _isSelected = true;

  _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenQddUtil.setHeight(200),
          ),
          Text(
            '欢迎加入签多多',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenQddUtil.setSp(48),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(10),
          ),
          Text(
            '第三方电子合同平台',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.7),
                fontSize: ScreenQddUtil.setSp(28)),
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(140),
          ),
          Expanded(
            child: FormCard(),
          )
        ],
      ),
    );
  }

//  Widget horizontalLine() => Padding(
//        padding: EdgeInsets.symmetric(horizontal: 16.0),
//        child: Container(
//          width: ScreenQddUtil.setWidth(120),
//          height: 1.0,
//          color: Colors.black26.withOpacity(0.2),
//        ),
//      );
//
//  Widget radioButton(bool isSelected) => Container(
//        width: 16.0,
//        height: 16.0,
//        padding: EdgeInsets.all(2.0),
//        decoration: BoxDecoration(
//            shape: BoxShape.circle,
//            border: Border.all(width: 2.0, color: Colors.black)),
//        child: isSelected
//            ? Container(
//                width: double.infinity,
//                height: double.infinity,
//                decoration:
//                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
//              )
//            : Container(),
//      );
}

/// form 表单
class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0,
              ),
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, -10.0),
                  blurRadius: 15.0)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Padding(
            padding: EdgeInsets.only(
                left: ScreenQddUtil.setWidth(32),
                right: ScreenQddUtil.setWidth(32),
                top: ScreenQddUtil.setHeight(80)),
            child: _formLogin(context)));
  }

  Widget _formLogin(context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          EnTextField(
            labelText: '账号',
            hintText: '手机号/邮箱',
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          EnTextField(labelText: '密码', hintText: '8-16位字母、数字组合', isPwd: true),
          SizedBox(
            height: ScreenQddUtil.setHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TapButton(
                  content: '账号注册',
                  callback: () {
                    NavigatorQdd.goRegPage(context);
                  }),
              SizedBox(
                width: ScreenQddUtil.setWidth(10),
              ),
              TapButton(
                content: '忘记密码',
                callback: () {
                  NavigatorQdd.goFindPwdPage(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(300),
          ),
          LoginOrReg(
            content: "登录",
            callback: () {
              print("登录成功");
            },
          )
        ],
      ),
    );
  }
}
