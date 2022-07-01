import 'package:flutter/material.dart';
import 'package:testware_informatics/views/login_view.dart';
import 'package:testware_informatics/views/profile_view.dart';
import 'package:testware_informatics/views/signup_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpView()
    );
  }
}
