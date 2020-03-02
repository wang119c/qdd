import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qdd/pages/menu_page.dart';
import 'package:qdd/widgets/zoom_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  MenuController menuController ;

  @override
  void initState()  {
    super.initState();
    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {

    }));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider.value(
      value: menuController,
      child: ZoomScaffold(
        menuScreen: MenuPage(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
              color: Colors.grey[200],
              child: Container(
                color: Colors.grey[200],
              ),
            )),
      ),
    );
  }
}
