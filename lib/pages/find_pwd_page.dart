import 'package:flutter/material.dart';
import 'package:qdd/routes/navigator_qdd.dart';
import 'package:qdd/utils/screen_qdd_util.dart';
import 'package:qdd/widgets/en_text_field.dart';
import 'package:qdd/widgets/login_or_reg.dart';

/// 找回密码
class FindPwdPage extends StatefulWidget {
  @override
  _FindPwdPageState createState() => _FindPwdPageState();
}

class _FindPwdPageState extends State<FindPwdPage> {
  @override
  Widget build(BuildContext context) {
    ScreenQddUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "找回密码",
          style: TextStyle(
            color: Color(0xff244252),
            fontSize: ScreenQddUtil.setSp(32),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff244252),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenQddUtil.setWidth(32),
              top: ScreenQddUtil.setHeight(80),
              right: ScreenQddUtil.setWidth(32)),
          child: _form(context),
        ),
      ),
    );
  }

  Widget _form(context) {
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
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget>[
              EnTextField(
                labelText: '验证码',
                hintText: '6位数字验证码',
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                child: Text(
                  "获取验证码",
                  style: TextStyle(color: Color(0xff7e59cb)),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(700),
          ),
          LoginOrReg(
            content: "下一步",
            callback: () {
              NavigatorQdd.goFindPwdNextPage(context);
            },
          )
        ],
      ),
    );
  }
}
