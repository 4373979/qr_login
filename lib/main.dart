import 'package:flutter/material.dart';
import 'package:qr_login/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //APP主体
      title: '1',
      home: LoginPage(), //APP打开后的初始页面
    );
  }
}
