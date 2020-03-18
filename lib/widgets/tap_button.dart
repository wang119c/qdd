import 'package:flutter/material.dart';

/// 跳转按钮
class TapButton extends StatelessWidget {
  final String content;
  final GestureTapCallback callback;

  const TapButton({Key key, this.content, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        content,
        style: TextStyle(color: Color(0xff7e59cb)),
      ),
      onTap: callback,
    );
  }
}
