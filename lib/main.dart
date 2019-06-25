import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/home_page.dart';
import 'package:flutter_app_demo/pages/splash_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          hintColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0)))),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) {
          return HomePage();
        }
      },
    );
  }
}
