import 'package:flutter/material.dart';
import 'package:qdd/utils/screen_qdd_util.dart';

/// 封装textfield
//class EnTextField extends StatefulWidget {
//  final String labelText;
//  final String hintText;
//  Color defaultColor = Color(0xffced7e0);
//  Color activeColor = Color(0xff7e59cb);
//  double circular;
//  double width;
//  bool isPwd;
//
//  EnTextField(
//      {Key key,
//      this.labelText,
//      this.hintText,
//      this.circular = 10,
//      this.width = 1,
//      this.isPwd = false})
//      : super(key: key);
//
//  @override
//  _EnTextFieldState createState() => _EnTextFieldState();
//}
//
//class _EnTextFieldState extends State<EnTextField> {
//  @override
//  Widget build(BuildContext context) {
//    return TextField(
////            autofocus: true,
//      maxLines: 1,
//      obscureText: widget.isPwd ? true : false,
//      style: TextStyle(color: Colors.black),
//      decoration: InputDecoration(
//        labelText: widget.labelText,
//        labelStyle: TextStyle(color: widget.activeColor),
//        hintText: widget.hintText,
//        hintStyle:
//            TextStyle(color: Colors.grey, fontSize: ScreenQddUtil.setSp(28)),
//        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.all(Radius.circular(widget.circular)),
//            borderSide:
//                BorderSide(color: widget.defaultColor, width: widget.width)),
//        focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.all(Radius.circular(widget.circular)),
//            borderSide:
//                BorderSide(color: widget.activeColor, width: widget.width)),
//        border: OutlineInputBorder(
//            borderRadius: BorderRadius.all(Radius.circular(widget.circular)),
//            borderSide:
//                BorderSide(color: widget.defaultColor, width: widget.width)),
//        contentPadding: EdgeInsets.all(widget.circular),
//      ),
//    );
//  }
//}

/// 封装textfield
class EnTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  Color defaultColor = Color(0xffced7e0);
  Color activeColor = Color(0xff7e59cb);
  double circular;
  double width;
  bool isPwd;
  final int maxLength;
  final TextInputType keyboardType;

  EnTextField(
      {Key key,
      this.labelText,
      this.hintText,
      this.circular = 10,
      this.width = 1,
      this.isPwd = false,
      this.maxLength,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
//            autofocus: true,
      keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
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
