import 'package:demo/screens/producr_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products List ',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const ProductList());
  }
}
