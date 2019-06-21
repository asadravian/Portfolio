import 'package:flutter_web/material.dart';

import './pages/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext contex) => MainPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
