// 导入了 Material UI 组件库 Material (opens new window)是一种标准的移动端和web端的视觉设计语言， Flutter 默认提供了一套丰富的 Material 风格的UI组件
import 'package:flutter/material.dart';

// 应用入口 main
void main () => runApp(const MyApp());

// StatelessWidget 无状态组件 Widget
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  
  // 重写 build 方法
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: '点击增加一', // 这个属性目前了解ios没啥用
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // home 为 flutter 应用的首页 
      home: const MyHomePage(), 
    );
  }
}

// StatefulWidget 有状态组件 
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}):super(key: key);
  //  有状态组件重写的是 createState 不需要 build 方法，但需要一个 State类 与之关联
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//  State 类  需要 build 方法
class _MyHomePageState extends State<MyHomePage> {
  // 声明一个数字类型的变量 
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold 是 Material 库中提供的页面脚手架
    return Scaffold(
      // appBar 导航栏
      appBar: AppBar(title: const Text('点击增加1')),
      // body 主屏幕;  Center 内容左右垂直居中;  Column 子组件沿屏幕垂直方向依次排列
      body: Center(child: Column(
        // 子组件居中
        mainAxisAlignment: MainAxisAlignment.center,
        // 子组件
        children: <Widget>[
          const Text('点击按钮'),
          Text(
            '$_counter',
            // 样式 暂时了解是大小
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      )),
      // floatingActionButton 右下角位置;  FloatingActionButton 悬浮按钮; 
      floatingActionButton: FloatingActionButton(
        // 点击事件 类型函数
        onPressed: () {
          // setState 方法会重新执行 build 方法
          setState(() {
            _counter++;
          });
        },
        // 长时间按下去会显示的提示语
        tooltip: '松开增加1', 
        // 图标
        child: const Icon(Icons.add)
      ),
    );
  }
}