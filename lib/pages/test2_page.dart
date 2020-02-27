import 'package:flutter/material.dart';
import 'package:qdd/utils/fluro_conver_util.dart';

class Test2Page extends StatefulWidget {
  final String name;

  final int age;

  final double score;

  final bool sex;

  final String personJson;

  Test2Page({this.name, this.age, this.score, this.sex, this.personJson});

  @override
  _Test2PageState createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  @override
  Widget build(BuildContext context) {
    String mName = widget.name;
    Map<String, dynamic> person =
        FluroConvertUtils.string2map(widget.personJson);
    print(person['name']);

    return Scaffold(
      body: Center(
        child: Text("测试"),
      ),
    );
  }
}
