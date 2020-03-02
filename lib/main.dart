import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qdd/providers/cart.dart';
import 'package:qdd/providers/counter.dart';
import 'package:qdd/routes/application.dart';
import 'package:qdd/routes/routes.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Counter(),
          ),
          ChangeNotifierProvider(
            create: (_) => Cart(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('zh', 'CN')
          ],
          onGenerateRoute: Application.router.generator,
          //home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
