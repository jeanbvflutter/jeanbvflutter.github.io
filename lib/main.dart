import 'package:flutter/material.dart';
import 'views/mainpage.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          accentColor: Colors.blue,
          buttonColor: Colors.blue), //button

      //home: is homepage, first page that is displayed
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => MainPage(),
      },

      // //onGenerateRoute returns MaterialPageRoute

      //Whenever onGenerateRoute fails to generate a route
      // onUnknownRoute: (RouteSettings settings) {},
    );
  }
}
