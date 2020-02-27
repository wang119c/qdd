import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenQddUtil {
  /// 初始化
  static init(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
  }

  /// 设置宽度
  static setWidth(double value) {
    return ScreenUtil().setWidth(value);
  }

  /// 设置高度
  static setHeight(double value) {
    return ScreenUtil().setHeight(value);
  }

  /// 设置字体
  static setSp(num fontSize, {bool allowFontScalingSelf}) {
    return ScreenUtil()
        .setSp(fontSize, allowFontScalingSelf: allowFontScalingSelf);
  }

  /// Text('设备宽度:${ScreenUtil.screenWidth}px'),
  //            Text('设备高度:${ScreenUtil.screenHeight}px'),
  //            Text('设备宽度:${ScreenUtil.screenWidthDp}dp'),
  //            Text('设备高度:${ScreenUtil.screenHeightDp}dp'),
  //            Text('设备的像素密度:${ScreenUtil.pixelRatio}'),
  //            Text('底部安全区距离:${ScreenUtil.bottomBarHeight}dp'),
  //            Text('状态栏高度:${ScreenUtil.statusBarHeight}dp'),

  /// 设备宽度
  static get getScreenWidth => ScreenUtil.screenHeight;

  /// 设备宽度
  static get getScreenHeight => ScreenUtil.screenHeight;

  /// 设备宽度
  static get getScreenWidthDp => ScreenUtil.screenWidthDp;

  /// 设备宽度
  static get getScreenHeightDp => ScreenUtil.screenHeightDp;

  /// 设备的像素密度
  static get getPixelRatio => ScreenUtil.pixelRatio;

  /// 底部安全区距离
  static get getBottomBarHeight => ScreenUtil.bottomBarHeight;

  /// 状态栏高度
  static get getStatusBarHeight => ScreenUtil.statusBarHeight;

  ///'实际宽度的dp与设计稿px的比例:${ScreenUtil().scaleWidth}',

  /// 实际宽度的dp与设计稿px的比例
  static get getScaleWidth => ScreenUtil().scaleWidth;

  /// 实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}
  static get getScaleHeight => ScreenUtil().scaleHeight;

  /// 字体缩放比例
  static get getTextScaleFactor => ScreenUtil.textScaleFactor;
}
