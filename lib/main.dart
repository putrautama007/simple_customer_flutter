import 'package:flutter/material.dart';
import 'package:simple_customer_flutter/ui/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Data Customer",
      theme: ThemeData(
          primarySwatch: Colors.deepOrange
      ),
      home: LoginPage(),
    );
  }
}