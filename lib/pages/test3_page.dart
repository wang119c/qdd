import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test3Page extends StatefulWidget {
  @override
  _Test3PageState createState() => _Test3PageState();
}

class _Test3PageState extends State<Test3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试李兰器"),
      ),
      body: WebView(
        initialUrl: "https://flutterchina.club/",
        //JS执行模式 是否允许JS执行
        javaScriptMode:JavaScriptMode.unrestricted ,
      )
    );
  }
}
