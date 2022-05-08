import 'package:flutter/material.dart';
import 'form_page.dart';
import 'package:flutter/cupertino.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: Formpage(),
    );
  }
}
