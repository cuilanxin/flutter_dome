import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Welcome to Flutter', 
      theme: ThemeData(primarySwatch: Colors.blueGrey), // 程序的主题
      home: Scaffold(
        appBar: AppBar(title: const Text('hello word')),
        body: const Center(child: Text('hello word'))
      )
    );
  }
}