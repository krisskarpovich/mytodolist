import 'package:flutter/material.dart';
import 'package:mytodo/pages/home.dart';


void main() =>  runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
  },
));




