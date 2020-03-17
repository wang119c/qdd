import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_qdd_util.dart';
import 'package:qdd/widgets/form_card.dart';
import 'package:qdd/widgets/social_icon.dart';


/// 登录页面
class LoginPageBak extends StatefulWidget {
  @override
  _LoginPageBakState createState() => _LoginPageBakState();
}

class _LoginPageBakState extends State<LoginPageBak> {
  @override
  Widget build(BuildContext context) {
    ScreenQddUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
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
          padding: EdgeInsets.only(top: 50.0),
          child: Image.asset("assets/images/login_image_01.png"),
        ),
        Expanded(
          child: Container(),
        ),
        Image.asset("assets/images/login_image_02.png")
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

  bool _isSelected = true  ;

  _radio(){
      setState(() {
        _isSelected = !_isSelected  ;

      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/login_logo.png',
                  width: ScreenQddUtil.setWidth(110),
                  height: ScreenQddUtil.setHeight(110),
                ),
                Text(
                  "签多多",
                  style: TextStyle(
                      fontSize: ScreenQddUtil.setSp(46),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: ScreenQddUtil.setHeight(180),
            ),
            FormCard(),
            SizedBox(
              height: ScreenQddUtil.setHeight(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12.0,
                    ),
                    GestureDetector(
                      onTap: _radio,
                      child: radioButton(_isSelected),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "记住密码",
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                ),
                InkWell(
                  child: Container(
                    width: ScreenQddUtil.setWidth(330),
                    height: ScreenQddUtil.setHeight(100),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                        borderRadius: BorderRadius.circular(6.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF6078ea).withOpacity(.3),
                              offset: Offset(0.0, 8.0),
                              blurRadius: 8.0)
                        ]),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            "登录",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenQddUtil.setHeight(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                horizontalLine(),
                Text(
                  "第三方登录",
                  style: TextStyle(fontSize: 16.0),
                ),
                horizontalLine(),
              ],
            ),
            SizedBox(
              height: ScreenQddUtil.setHeight(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  colors: [
                    Color(0xFF102397),
                    Color(0xFF187adf),
                    Color(0xFF00eaf8),
                  ],
                  iconData: CustomIcons.facebook,
                  onPressed: () {},
                ),
                SocialIcon(
                  colors: [
                    Color(0xFFff4f38),
                    Color(0xFFff355d),
                  ],
                  iconData: CustomIcons.googlePlus,
                  onPressed: () {},
                ),
                SocialIcon(
                  colors: [
                    Color(0xFF17ead9),
                    Color(0xFF6078ea),
                  ],
                  iconData: CustomIcons.twitter,
                  onPressed: () {},
                ),
                SocialIcon(
                  colors: [
                    Color(0xFF00c6fb),
                    Color(0xFF005bea),
                  ],
                  iconData: CustomIcons.linkedin,
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: ScreenQddUtil.setSp(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "新用户",
                  style: TextStyle(),
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "注册",
                      style: TextStyle(color: Color(0xFF5d74e3)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenQddUtil.setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(0.2),
        ),
      );

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );
}

class CustomIcons {
  static const IconData twitter = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData facebook = IconData(0xe901, fontFamily: "CustomIcons");
  static const IconData googlePlus =
      IconData(0xe902, fontFamily: "CustomIcons");
  static const IconData linkedin = IconData(0xe903, fontFamily: "CustomIcons");
}
