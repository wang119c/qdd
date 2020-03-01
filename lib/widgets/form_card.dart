import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_qdd_util.dart';

/// form 表单
class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenQddUtil.setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 15.0)
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "登录",
              style: TextStyle(
                fontSize: ScreenQddUtil.setSp(45),
                letterSpacing: 0.6
              ),
            ),
            SizedBox(
              height: ScreenQddUtil.setHeight(30),
            ),
            Text(
              "用户名",
              style: TextStyle(
                fontSize: ScreenQddUtil.setSp(26)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "用户名",
                hintStyle: TextStyle(
                  color: Colors.grey ,
                  fontSize: 12.0
                )
              ),
            ),
            SizedBox(
              height: ScreenQddUtil.setSp(26),
            ),
            Text(
              "密码",
              style: TextStyle(
                fontSize: ScreenQddUtil.setSp(26)
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "请输入密码",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0
                )
              ),
            ),
            SizedBox(
              height: ScreenQddUtil.setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "忘记密码",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: ScreenQddUtil.setSp(28)
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
