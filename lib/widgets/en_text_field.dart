import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_qdd_util.dart';
/// 封装textfield
class EnTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  Color defaultColor = Color(0xffced7e0);
  Color activeColor = Color(0xff7e59cb);
  double circular;
  double width;
  bool isPwd;

  EnTextField(
      {Key key,
        this.labelText,
        this.hintText,
        this.circular = 10,
        this.width = 1,
        this.isPwd = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
//            autofocus: true,
      maxLines: 1,
      obscureText: isPwd ? true : false,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: activeColor),
        hintText: hintText,
        hintStyle:
        TextStyle(color: Colors.grey, fontSize: ScreenQddUtil.setSp(28)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(circular)),
            borderSide: BorderSide(color: defaultColor, width: width)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(circular)),
            borderSide: BorderSide(color: activeColor, width: width)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(circular)),
            borderSide: BorderSide(color: defaultColor, width: width)),
        contentPadding: EdgeInsets.all(circular),
      ),
    );
  }
}
