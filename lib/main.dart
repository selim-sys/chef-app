import 'package:chefapp/screens/choose_language_screen.dart';
import 'package:chefapp/screens/login-screen.dart';
import 'package:chefapp/screens/splash-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(ChefApp());
}
class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
