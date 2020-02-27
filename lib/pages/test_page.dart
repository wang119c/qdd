import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_util_qdd.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {

    ScreenUtilQdd.init(context) ;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(ScreenUtilQdd.setWidth(10)),
                  width: ScreenUtilQdd.setWidth(375),
                  height: ScreenUtilQdd.setHeight(200),
                  color: Colors.red,
                  child: Text(
                    '我的宽度:${ScreenUtilQdd.setWidth(375)}dp \n'
                        '我的高度:${ScreenUtilQdd.setHeight(200)}dp',
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtilQdd.setSp(24)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenUtilQdd.setWidth(10)),
                  width: ScreenUtilQdd.setWidth(375),
                  height: ScreenUtilQdd.setHeight(200),
                  color: Colors.blue,
                  child: Text(
                      '我的宽度:${ScreenUtilQdd.setWidth(375)}dp \n'
                          '我的高度:${ScreenUtilQdd.setHeight(200)}dp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtilQdd.setSp(24))),
                )
              ],
            ),
            Text('设备宽度:${ScreenUtilQdd.getScreenWidth}px'),
            Text('设备高度:${ScreenUtilQdd.getScreenHeight}px'),
            Text('设备宽度:${ScreenUtilQdd.getScreenWidthDp}dp'),
            Text('设备高度:${ScreenUtilQdd.getScreenHeightDp}dp'),
            Text('设备的像素密度:${ScreenUtilQdd.getPixelRatio}'),
            Text('底部安全区距离:${ScreenUtilQdd.getBottomBarHeight}dp'),
            Text('状态栏高度:${ScreenUtilQdd.getStatusBarHeight}dp'),
            Text(
              '实际宽度的dp与设计稿px的比例:${ScreenUtilQdd.getScaleWidth}',
              textAlign: TextAlign.center,
            ),
            Text(
              '实际高度的dp与设计稿px的比例:${ScreenUtilQdd.getScaleHeight}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenUtilQdd.setHeight(100),
            ),
            Text('系统的字体缩放比例:${ScreenUtilQdd.getTextScaleFactor}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('我的文字大小在设计稿上是24px，不会随着系统的文字缩放比例变化',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtilQdd.setSp(24),
                    )),
                Text('我的文字大小在设计稿上是24px，会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtilQdd
                            .setSp(24, allowFontScalingSelf: true))),
              ],
            )
          ],
        ),
      ),
    );
  }




}
