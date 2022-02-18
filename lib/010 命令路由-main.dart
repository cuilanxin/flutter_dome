import 'package:flutter/material.dart';

// 应用入口 main
void main () => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: '点击增加一',
      // initialRoute:"/",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomeRoute(),
      routes: {
        "new_page":(context) =>  NewRoute(text: ModalRoute.of(context)?.settings.arguments as String),
        // "/":(context) => const HomeRoute(),
      }
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
          onPressed: () {
             Navigator.pushNamed(context, "new_page",arguments: '父传子111');

            // var result = await Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context){ return const NewRoute(text: '父传子'); })
            // );
            // print('$result');
          },
        )
      ),
    );
  }
}
class NewRoute extends StatelessWidget {
  const NewRoute({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('新页面')),
      body: Center(
        child: ElevatedButton(
          child: Text('点击回到首页--$text'),
          onPressed: ()=> Navigator.pop(context,'返回值'),
        )
      ),
    );
  }
}