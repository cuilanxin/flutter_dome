// 导入了 Material UI 组件库 Material (opens new window)是一种标准的移动端和web端的视觉设计语言， Flutter 默认提供了一套丰富的 Material 风格的UI组件
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
      home: const CounterWidget(title: '首页', initValue: 1,), 
    );
  }
}
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key,required this.title, this.initValue = 0}) : super(key: key);
  final String title;
  final int initValue; 
  @override
  _CounterWidgetState createState() {
    return _CounterWidgetState();
  }
}
class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print('initState 01'); 
  }
  @override
  Widget build(BuildContext context) {
    print('build 03');
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: TextButton(
          child: Text('$_counter'),onPressed: () => setState(() => ++_counter)
        )
      )
    );
  }
  @override
  void didUpdateWidget(CounterWidget oldWidget){
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }
  @override
  void deactivate(){
    super.deactivate();
    print('deactivate 03');
  }
  @override
  void dispose(){
    super.dispose();
    print('dispose 04');
  }
  @override
  void reassemble() {
    super.reassemble();
    print('reassemble 02');
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('didChangeDependencies 02');
  }
}