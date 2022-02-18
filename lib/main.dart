import 'package:flutter/material.dart';

// 应用入口 main
void main () => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: '点击增加一',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomeRoute()
    );
  }
}
class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: Center(
        child: TextButton(
          child: const Text('点击去新页面'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){ return const NewRoute(); })
            );
          },
        )
      ),
    );
  }
}
class NewRoute extends StatelessWidget {
  const NewRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('新页面')),
      body: const Text('新页面'),
    );
  }
}