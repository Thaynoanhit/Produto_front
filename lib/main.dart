import 'package:flutter/material.dart';
import 'list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Produtos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListPage(),
    );
  }
}
