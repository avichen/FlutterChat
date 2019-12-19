import 'package:flutter/material.dart';
import 'package:flutterchat/screens/chat_list.dart';
// import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9E8),
      ),
      // home: HomePage(),
      home: ChatList(),
    );
  }
}
