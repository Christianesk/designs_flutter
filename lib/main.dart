import 'package:designs_app/src/challenges/animate_square_page.dart';
// import 'package:designs_app/src/pages/animations_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: AnimateSquarePage()
    );
  }
}