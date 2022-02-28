import 'package:flutter/material.dart';
import 'dart:math' as math;  

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
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaddingWidget())), 
              child: const Text('PaddingWidget-示例')
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DecoratedBoxWidget())), 
              child: const Text('DecoratedBoxWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const TransformWidget())),
              child: const Text('TransformWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const ContainerWidget())), 
              child: const Text('ContainerWidget-示例')
            ),
             ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const ClipWidget())), 
              child: const Text('ClipWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const FittedBoxWidget())), 
              child: const Text('FittedBoxWidget-示例')
            ),
             ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const ScaffoldWidget())), 
              child: const Text('ScaffoldWidget-示例')
            ),
          ]
        )
      ),
    );
  }
}


class PaddingWidget extends StatelessWidget {
  const PaddingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PaddingWidget')),
      body: Column(
        children: [
          Padding(
            //  fromLTRB  all only symmetric
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(color: Colors.red,height: 100,),
              ],
            )
          ),
          Container(color: Colors.black,height: 100,)
        ]
      )
    );
  }
}

class DecoratedBoxWidget extends StatelessWidget {
  const DecoratedBoxWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DecoratedBoxWidget-示例')),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            // 背景渐变
            gradient: LinearGradient( colors: [Colors.red, Colors.orange.shade700]),
            // 圆角
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54, // 阴影颜色
                offset: Offset(4.0,4.0), // 阴影偏移量 
                blurRadius: 1.0  // 阴影模糊程度
              )
            ]
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text("Login", style: TextStyle(color: Colors.white))
          ), 
        ),
      ),
    );
  }
}

class TransformWidget extends StatelessWidget {
  const TransformWidget({Key?key}) : super(key: key);
  Widget myTransform(){
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.3),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.deepOrange,
          child: const Text('Apartment for rent!'),
        ),
      )
    );
  }
  Widget myTranslate() {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.red),
      child: Transform.translate(
        offset: const Offset(10,-4),
        child: const Text('A--B-C-D')
      ),
    );
  }
  Widget myRotate() {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.red),
      // import 'dart:math' as math;  注意要引入
      child: Transform.rotate(
        angle: math.pi/1.5,
        child: const Text('我是旋转'),
      ),
    );
  }
  Widget myScale() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.scale(
        scale: 2,
        child: Text('我是缩放'),
      ),
    );
  }
  Widget myDemo() {
    // 发生重叠
    // Transform的变换是应用在绘制阶段，
    // 而并不是应用在布局(layout)阶段，
    // 所以无论对子组件应用何种变化，
    // 其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的
    return Row(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.red),
          child: Transform.scale(
            scale: 1.2,
            child: const Text('demo'),
          ),
        ),
        // 这个就不会重叠
        // RotatedBox是作用于layout阶段，
        // 所以子组件会旋转90度（而不只是绘制的内容），decoration会作用到子组件所占用的实际空间上，
        //  DecoratedBox(
        //   decoration: BoxDecoration(color: Colors.red),
        //   //将Transform.rotate换成RotatedBox  
        //   child: RotatedBox(
        //     quarterTurns: 1, //旋转90度(1/4圈)
        //     child: Text("Hello world"),
        //   ),
        // ),
        const Text('demo', style: TextStyle(color: Colors.green, fontSize: 18.0))
      ]
    );
  }
  
  final TextStyle style= const TextStyle(fontSize: 16,fontWeight: FontWeight.w700);
  Widget myPadding(String text, {double value = 30.0}) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: Text(text,style: style)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TransformWidget-示例')),
      body: Column(
        children: [
          myPadding('Transform-偏移'),
          myTransform(),
          myPadding('Translate-xy偏移',value: 20),
          myTranslate(),
          myPadding('Rotate-旋转'),
          myRotate(),
          myPadding('Scale-缩放'),
          myScale(),
          myPadding('demo-缩放'),
          // myDemo() // 这个用了 Row部件所以会让上面的看着是居中效果
        ]
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ContainerWidget-示例')),
      body: Container(
        // margin padding 都是基于 Padding 部件实现的
        // Padding(
        //   padding: EdgeInsets.all(20.0),
        //   child: DecoratedBox(
        //     decoration: BoxDecoration(color: Colors.orange),
        //     child: Text("Hello world!"),
        //   ),
        // ),
        // DecoratedBox(
        //   decoration: BoxDecoration(color: Colors.orange),
        //   child: Padding(
        //     padding: const EdgeInsets.all(20.0),
        //     child: Text("Hello world!"),
        //   ),
        // ),
        margin: const EdgeInsets.only(top:50, left: 120),
        constraints: const BoxConstraints.tightFor(width: 200, height: 150),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.red,Colors.orange],
            center: Alignment.centerLeft,
            radius: 1.2
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(4, 4),
              blurRadius: 4
            )
          ]
        ),
        transform: Matrix4.rotationZ(.2),
        alignment: Alignment.center,
        // width: 100,
        // height: 100,
        // color: Colors.black,
        child: const Text('5.20',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
      ),
    );
  }
}

class MyselfRect extends CustomClipper<Rect> {
  // 自定义剪裁
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10, 10, 40, 48);
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class ClipWidget extends StatelessWidget {
  const ClipWidget({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipWidget-示例')),
      body: Center(
        child: Column(
          children:  [
            const Image(image: AssetImage("static/image/002.jpg"), width: 60),
            const ClipOval(
              child: Image(image: AssetImage("static/image/002.jpg"),width: 60),
            ),
            ClipRRect(
              child: Image.asset("static/image/002.jpg",width: 60),
              borderRadius: BorderRadius.circular(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .4,
                  child: Image.asset("static/image/002.jpg",width: 60),
                ),
                const Text("你好世界",style: TextStyle(color: Colors.green))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .6,
                    child: Image.asset("static/image/002.jpg",width: 60),
                  ),
                ),
                const Text("你好世界",style: TextStyle(color: Colors.green))
              ],
            ),
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: ClipRect(
                clipper: MyselfRect(),
                child: const Image(image: AssetImage("static/image/002.jpg"), width: 60),
              ),
            )
          ],
        ),
      )
    );
  }
}

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({Key?key}):super(key: key);
  Widget wContainer(BoxFit fit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: fit,
        child: Container(width: 60,height: 100,color: Colors.blue,),
      ),
    );
  }
  Widget wRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text(text),Text(text),Text(text)]
    );
  }
  Widget SingleLine(Widget child) {
    return LayoutBuilder(builder: (_,constraints) {
      return FittedBox(
        child: ConstrainedBox(
          constraints: constraints.copyWith(
            // maxWidth: constraints.maxWidth
            minWidth: constraints.maxWidth,
            maxWidth: double.infinity,
          ),
          child: child,
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('FittedBoxWidget-示例')),
      body: Column(
        children: [
          // wContainer(BoxFit.none),
          ClipRect(child:  wContainer(BoxFit.none)),
          const Text('WenDux'),
          wContainer(BoxFit.contain),
          const Text('Wendux'),
          ...[
            wRow('90000000000000000'), 
            SingleLine( wRow('90000000000000000') ),
            const Text('90000000000000000'),
            wRow(' 800 '),
            FittedBox(child: wRow(' 800 ')),
            SingleLine( wRow('800') ),
          ].map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),child: e))
        ]
      ),
    );
  }
}

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key?key}):super(key: key);
  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}
class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 导航栏
        title: const Text('ScaffoldWidget-示例'), 
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.share))], // 右边
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.abc)),// 左边
        automaticallyImplyLeading: true, // 自动实现返回
        backgroundColor: Colors.red, // 背景色
        // bottom: ,
      ),
      // drawer: Text('22 d'), // 抽屉 左=》
      floatingActionButton: FloatingActionButton(child: Icon(Icons.abc_sharp),onPressed: (){},), // 右下角 浮动按钮 
      // bottomNavigationBar: BottomNavigationBar( // 底部导航
      //   currentIndex: _selectedIndex,
      //   // fixedColor: Colors.blue,
      //   onTap:  (int index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: 'data', backgroundColor: Colors.red, activeIcon: Icon(Icons.abc)),
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: 'data11'),
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: 'data133'),
      //   ]
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home),onPressed: (){},),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business),onPressed: (){},),
          ]
        ),
      ),
      body: Text('sss')
    );
  }
}