import 'package:flutter_web/material.dart';

import './pages/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ibtesam | Portfolio',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext contex) => MainPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
