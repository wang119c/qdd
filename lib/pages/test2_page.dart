import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qdd/providers/cart.dart';
import 'package:qdd/providers/counter.dart';
import 'package:qdd/utils/fluro_conver_util.dart';
import 'package:qdd/utils/storage_qdd_util.dart';
import 'package:qdd/event/events.dart';

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
  String _counter;
  StreamSubscription<MyEventA> myEventA;
  Color _test = Colors.black;

  @override
  void initState() {
    super.initState();

    //监听广播
    myEventA = eventBus.on<MyEventA>().listen((event) {
      print(event);
      setState(() {
        _test = Colors.blue;
      });
    });
  }

  @override
  void dispose() {
    myEventA.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String mName = widget.name;
    Map<String, dynamic> person =
        FluroConvertUtils.string2map(widget.personJson);

    var counterProvider = Provider.of<Counter>(context);
    var cartProvider = Provider.of<Cart>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: RaisedButton(
                onPressed: _incrementCounter, child: Text('Increment Counter')),
          ),
          Divider(
            height: 10,
          ),
          Container(
            child: Text("${_counter}"),
          ),
          Divider(
            height: 10,
          ),
          Container(
            child: Text("${counterProvider.count}"),
          ),
          Container(
            child: Text("事件监听"),
            width: double.infinity,
            height: 200.0,
            color: _test,
          ),
          Divider(
            height: 10,
          ),
          Container(
            child: FlatButton(
              child: Text("发送事件广播"),
              onPressed: () {
                eventBus.fire(MyEventA("hello"));
              },
            ),
          ),
          Column(
            children: <Widget>[
              CartItem(),
              Divider(
                height: 10,
              ),
              CartNum()
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("测试provider"),
        onPressed: () {
          counterProvider.increment();
          cartProvider.addData("haha");
        },
      ),
    );
  }

  void _incrementCounter() async {
    String counter = await StorageQddUtil.getString("counter");
    if (counter == null) {
      print(222);
      await StorageQddUtil.setString("counter", "ok");
    } else {
      print(counter);
    }
    setState(() {
      _counter = counter;
    });
  }
}

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cart>(context);

    return cartProvider.cartList.length > 0
        ? Column(
            children: cartProvider.cartList.map((value) {
            return ListTile(
              title: Text("子组件${value}"),
              trailing: InkWell(
                child: Icon(Icons.delete),
                onTap: (){
                  cartProvider.delData(value);
                },
              ),
            );
          }).toList())
        : Text("数据为空");
  }
}

class CartNum extends StatefulWidget {
  @override
  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cart>(context);
    return Text("数量${cartProvider.cartNum}");
  }
}
