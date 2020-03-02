import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qdd/model/menu_item.dart';
import 'package:qdd/routes/navigator_qdd.dart';
import 'package:qdd/widgets/circular_image.dart';
import 'package:qdd/widgets/zoom_scaffold.dart';

class MenuPage extends StatelessWidget  {
  final String imgUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.search, "搜索"),
    MenuItem(Icons.shopping_basket, "搜索"),
    MenuItem(Icons.favorite, "钟意"),
    MenuItem(Icons.code, "代码"),
    MenuItem(Icons.format_list_bulleted, "订单"),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details){
        print(details);
          if(details.delta.dx < -6){
            Provider.of<MenuController>(context,listen: false).toggle() ;
          }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 18,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0xff454dff),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: CircularImage(
                    image: NetworkImage(imgUrl),
                  ),
                ),
                Text(
                  "杨源",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            Spacer(),
            Column(
              children: options.map((item) {
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              onTap: () {

              },
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text(
                "设置",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                NavigatorQdd.goLoginPage(context);
                Provider.of<MenuController>(context,listen: false).toggle() ;
              },
              leading: Icon(
                Icons.headset_mic,
                color: Colors.white,
                size: 20,
              ),
              title: Text(
                "测试登录",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
