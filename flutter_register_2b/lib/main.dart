import 'package:flutter/material.dart';
import 'package:flutter_register_2b/home_page.dart';
import 'package:flutter_register_2b/login_page.dart';
import 'package:flutter_register_2b/register_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login/register flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=> LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home':(context)=>HomePage()
      },
    );
  }
}