import 'package:flutter/material.dart';
import 'package:admin_securechat/auth/login.dart';
import 'package:admin_securechat/home/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Dashboard(),
    );
  }
}
