import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_qdd_util.dart';

/// 登录或注册按钮
class LoginOrReg extends StatelessWidget {
  final double radius;

  final String content;

  final GestureTapCallback callback;

  const LoginOrReg({Key key, this.radius = 10, this.content, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xff7e59cb),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              child: Container(
                alignment: Alignment(0, 0),
                width: double.infinity,
                height: ScreenQddUtil.setHeight(96),
                child: Text(content,
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenQddUtil.setSp(32))),
              ),
              onTap: callback),
        ));
  }
}
