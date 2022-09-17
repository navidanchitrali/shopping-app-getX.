// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shopping_app_getx/ui/screens/home_screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
