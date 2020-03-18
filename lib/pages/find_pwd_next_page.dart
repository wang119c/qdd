import 'package:flutter/material.dart';
import 'package:qdd/routes/navigator_qdd.dart';
import 'package:qdd/utils/screen_qdd_util.dart';
import 'package:qdd/widgets/en_text_field.dart';
import 'package:qdd/widgets/login_or_reg.dart';

/// 找回密码下一步
class FindPwdNextPage extends StatefulWidget {
  @override
  _FindPwdNextPageState createState() => _FindPwdNextPageState();
}

class _FindPwdNextPageState extends State<FindPwdNextPage> {
  @override
  Widget build(BuildContext context) {
    ScreenQddUtil.init(context);
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xff244252),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "找回密码",
        style: TextStyle(
          color: Color(0xff244252),
          fontSize: ScreenQddUtil.setSp(32),
        ),
      ),
    );
  }

  Widget _body(context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: _childForm(context),
    );
  }

  Widget _childForm(context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenQddUtil.setWidth(32),
        top: ScreenQddUtil.setHeight(80),
        right: ScreenQddUtil.setWidth(32),
      ),
      child: _form(context),
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
            labelText: '新密码',
            hintText: '8-16位字母、数字组合',
            isPwd: true,
          ),
          SizedBox(
            height: ScreenQddUtil.setHeight(830),
          ),
          LoginOrReg(
            content: "确认",
            callback: () {
              NavigatorQdd.goLoginPage(context);
            },
          )
        ],
      ),
    );
  }
}
