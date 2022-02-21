import 'package:flutter/material.dart';

// 应用入口 main
void main () => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build (BuildContext context) {
    return const MaterialApp(
      title: '点击增加一',
      // initialRoute:"/",
      // theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HomeRoute(),
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
        child: Column(
          children: [ 
            ElevatedButton(child: const Text('TextsWidget-示例'), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TextsWidget()))), 
            ElevatedButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const ButtonsWidget())), child:  const Text('ButtonsWidget-示例')),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const IconsImagesWidget())), child: const Text('IconsImagesWidget-示例')),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const SwitchCheckboxWidget())), child: const Text('SwitchCheckboxWidget-示例')),
            ElevatedButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LinearProgressIndicatorWidget())), child: const Text('LinearProgressIndicatorWidget-进度指示器')),
            ElevatedButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FormsWidget())), child: const Text('表单'))
          ]
        )
      ),
    );
  }
}

class TextsWidget extends StatelessWidget {
  const TextsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextsWidget-示例')),
    //   body:  Text(
    //     "Hello world",
    //     style: TextStyle(
    //       color: Colors.blue,
    //       fontSize: 18.0,
    //       height: 1.2,  
    //       fontFamily: "Courier",
    //       background: Paint()..color=Colors.yellow,
    //       decoration:TextDecoration.underline,
    //       decorationStyle: TextDecorationStyle.dashed
    //     ),
    //   ),
    // );
      body: DefaultTextStyle(
        style: const TextStyle(
          color:Colors.red,
          fontSize: 20.0,
        ),
        textAlign: TextAlign.start,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("hello world"),
            Text("I am Jack"),
            Text("I am Jack",
              style: TextStyle(
                inherit: false, //2.不继承默认样式
                color: Colors.grey
              ),
            ),
          ],
        )
      )
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ButtonsWidget-示例')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('ElevatedButton')),
            ElevatedButton.icon(onPressed: (){}, label: const Text('ElevatedButton-带图标'),icon: const Icon(Icons.add)),
            TextButton(onPressed: (){}, child: const Text('TextButton')),
            TextButton.icon(onPressed: (){}, label: const Text('TextButton-带图标'), icon: const Icon(Icons.send)),
            OutlineButton(onPressed: (){},child: const Text('OutlineButton-已弃用')),
            OutlineButton.icon(onPressed: (){},label: const Text('OutlineButton-带图标-已弃用'),icon: const Icon(Icons.thumb_up)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_up),tooltip: 'IconButton'),
          ]
        ),
      )
    );
  }
}

class IconsImagesWidget extends StatelessWidget {
  const IconsImagesWidget({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IconsImagesWidget-示例')),
      body: Column(
        children: [
          const Image(image: AssetImage("static/image/002.jpg"), width: 100.0, alignment: Alignment.topLeft,),
          Image.asset("static/image/002.jpg",width: 100.0),
          const Image(image: NetworkImage("https://user-images.githubusercontent.com/57083007/154897359-3ba1c55c-bcec-45c8-8fa9-ada5cebb4655.jpg"),width: 200.0),
          Image.network("https://user-images.githubusercontent.com/57083007/154897359-3ba1c55c-bcec-45c8-8fa9-ada5cebb4655.jpg", width: 200.0),
          const Icon(Icons.error,color: Colors.red,size: 100),
          const Text("\uE03e",style: TextStyle(fontSize: 30,color: Colors.blue))
        ]
      ),
    );
  }
}

class SwitchCheckboxWidget extends StatefulWidget {
  const SwitchCheckboxWidget({Key?key}):super(key: key);
  @override
  _SwitchCheckboxWidgetState createState () => _SwitchCheckboxWidgetState();
}

class _SwitchCheckboxWidgetState extends State<SwitchCheckboxWidget> {
  bool switch1 = false;
  bool checkbox1 = false;
  void switchChanged(bool params) {
    setState(() {
      switch1 = params;
    });
  }
  void checkboxChanged(bool? params) {
    setState(() {
      checkbox1 = params!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SwitchCheckboxWidget-示例')),
      body: Column(
        children: [
          Switch(value: switch1, onChanged: switchChanged, activeColor: Colors.red,),
          Checkbox(value: checkbox1, onChanged: checkboxChanged, activeColor: Colors.red,)
        ]
      ),
    );
  }
}

class LinearProgressIndicatorWidget extends StatelessWidget {
  const LinearProgressIndicatorWidget({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('进度指示器')),
      body: Column(
        children: [
          const Text.rich(TextSpan(
            children: [TextSpan(text: '线性', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, height: 3)), TextSpan(text: '进度条')]
          )),
          const LinearProgressIndicator(
            value: 0.2,
            backgroundColor: Colors.amber,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
           const Text.rich(TextSpan(
            children: [TextSpan(text: '圆圈', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, height: 3)), TextSpan(text: '进度条')]
          )),
          CircularProgressIndicator(backgroundColor: Colors.amber[200],color: Colors.red,value: .4, strokeWidth: 10),
          const Text('自定义尺寸', style: TextStyle(height: 4)),
          const SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(),
          )
        ]
      ),
    );
  }
}

class FormsWidget extends StatefulWidget {
  const FormsWidget({Key? key}) : super(key: key);
  @override
  _FormsWidget createState() => _FormsWidget();
}
class _FormsWidget extends State<FormsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('表单')),
    );
  }
}
