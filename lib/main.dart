
import 'package:flutter/material.dart';
import 'package:login_sqlite/login.dart';

void main(){
  runApp(LoginSqlLiteApp());
}

class LoginSqlLiteApp extends StatelessWidget {
  const LoginSqlLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}