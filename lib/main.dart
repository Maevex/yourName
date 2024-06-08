import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:app/add.dart';
import 'package:app/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => home(),
        '/add':(context) => test()
      },
      
    );
  }
}
