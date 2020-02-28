import 'package:event_bus/event_bus.dart';

///  事件通知 广播事件
EventBus eventBus = EventBus();

/// 测试A
class MyEventA {
  String text;

  MyEventA(this.text);
}

/// 测试B
class MyEventB {
  String text;

  MyEventB(this.text);
}
