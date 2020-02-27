import 'package:shared_preferences/shared_preferences.dart';

/// 数据持久化
class StorageQddUtil{

  /// 设置字符串
  static Future<void> setString(key,value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  /// 获取字符串
  static Future<String> getString(key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  /// 删除字符串
  static Future<void> remove(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  /// 清空所有的本地数据
  static Future<void> clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }










}