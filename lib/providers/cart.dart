import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List _cartList = [];

  List get cartList => _cartList;

  int get cartNum => _cartList.length;

  Cart() {}

  addData(value) {
    this._cartList.add(value);
    notifyListeners();
  }

  delData(value) {
    this._cartList.remove(value);
    notifyListeners();
  }
}
