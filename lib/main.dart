import 'package:flutter/material.dart';
import 'package:task6_3lir/screens/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
        title: 'Drawing Paths',
        theme:ThemeData(
          primaryColor: Color(0xffF6C658),
          accentColor: Color(0xffFDA038),
          canvasColor:Color(0xffFFFFFF),
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1:TextStyle(
                color: Color(0xff020804),
              ),
              body2:TextStyle(
                color: Color(0xff020804),
              ),
              title: TextStyle(
                fontSize: 45,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              )
          ),
        ) ,

      );
  }
}
