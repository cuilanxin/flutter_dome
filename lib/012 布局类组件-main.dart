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
            ElevatedButton(
              child: const Text('ConstrainedBox-示例'), 
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConstrainedBoxWidget()))
            ), 
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const SizedBoxWidget())), 
              child: const Text('SizedBoxWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UnconstrainedBoxWidget())), 
              child: const Text('UnconstrainedBox-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const RowWidget())), 
              child: const Text('RowWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const FlexAndExpandedWidget())), 
              child: const Text('FlexAndExpandedWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const WrapAndFlowWidget())), 
              child: const Text('WrapAndFlowWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const StackPositionedWidget())), 
              child: const Text('StackPositionedWidget-示例')
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const AlignsWidget(),)), 
              child: const Text('AlignsWidget-示例') 
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const LayoutBuildersWidget())), 
              child: const Text('LayoutBuildersWidget-示例') 
            )
          ]
        )
      ),
    );
  }
}

class DemoRedBox extends StatelessWidget {
  const DemoRedBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(decoration: BoxDecoration(color: Colors.red));
  }
}

// SizedBox ConstrainedBox 如果有多个父级限制，则会取属性最大的进行组合
class ConstrainedBoxWidget extends StatelessWidget {
  const ConstrainedBoxWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ConstrainedBox-示例')),
      body: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity,minHeight: 150.0),
        child: Container(height: 200,child: const DemoRedBox(),),
      ),
    );
  }
}

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({Key?key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('SizedBoxWidget-示例')),
      // SizedBox只是ConstrainedBox的一个定制
      // constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0), 
      // BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
      // 是相等的
      body: const SizedBox(child: DemoRedBox(), height: 100, width: 100),
    );
  }
}

// UnconstrainedBox 不继承父级限制但是父级的坑位还是存在 
class UnconstrainedBoxWidget extends StatelessWidget{
  const UnconstrainedBoxWidget({Key?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UnconstrainedBoxWidget-示例')),
      body: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 100,minWidth: 100),
        child: UnconstrainedBox(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 20,minWidth: 20),
            child: const DemoRedBox(),
          )
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RowWidget-示例')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisSize: MainAxisSize.min,
            // textDirection: TextDirection.ltr,
            verticalDirection: VerticalDirection.up,
            children: const [Text('hello world', style: TextStyle(fontSize: 30),),Text('I am 靓仔')]
          ),
          // Column() 与 Row 一样
        ],
      )
    );
  }
}

class FlexAndExpandedWidget extends StatelessWidget {
  const FlexAndExpandedWidget({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlexAndExpandedWidget-示例')),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1, 
                child: Container( height: 30.0, color: Colors.red )
              ),
              Expanded(
                flex: 4,
                child: Container( height: 30.0, color: Colors.black )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(height: 30.0,color: Colors.red)
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 0,
                    child: Container(height: 10.0,color: Colors.black)
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}

class WrapAndFlowWidget extends StatelessWidget {
  const WrapAndFlowWidget({Key ? key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WrapAndFlowWidget-示例')),
      body: Column(
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.start,
            children: const [
              Chip(label: Text('Hamilton'), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A'))),
              Chip(label: Text('Lafayette'), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M'))),
              Chip(label: Text('Mulligan'), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H'))),
              Chip(label: Text('Laurens'), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J'))),
              Chip(label: Text('Laurens'), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J'))),
            ],
          ),
          const Text('Flow',style: TextStyle(height: 2)),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: [
              Container(width: 80.0, height:80.0, color: Colors.red,),
              Container(width: 80.0, height:80.0, color: Colors.green,),
              Container(width: 80.0, height:80.0, color: Colors.blue,),
              Container(width: 80.0, height:80.0,  color: Colors.yellow,),
              Container(width: 80.0, height:80.0, color: Colors.brown,),
              Container(width: 80.0, height:80.0,  color: Colors.purple,),
            ],
          )
        ],
      )
    );
  }
}

class TestFlowDelegate extends FlowDelegate{
  EdgeInsets margin;
  TestFlowDelegate({this.margin = EdgeInsets.zero});
  double width = 0;
  double height = 0;
  @override
  void paintChildren(FlowPaintingContext context){
    var x = margin.left;
    var y = margin.top;
    for(int i = 0; i< context.childCount; i++){
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }
  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class StackPositionedWidget extends StatelessWidget {
  const StackPositionedWidget({Key? key}) : super(key: key);
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StackPositionedWidget-示例')),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            // Stack子元素是堆叠的 后面的元素会覆盖前面的元素
            const Positioned(child: Text('left 18'),left: 18,),
            const Positioned(child: Text('top 18'),top: 18,),
            Container(child: const Text('hello world', style: TextStyle(color: Colors.white)), color: Colors.red),
            const Text('data'),
          ],
        ),
      ),
    );
  }
}

class AlignsWidget extends StatelessWidget {
  const AlignsWidget({Key?key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AlignsWidget-示例')),
      body: Container(
        height: 120,
        width: 120,
        color: Colors.amber[200],
        child: const Align(
          // widthFactor: 2,
          // heightFactor: 2,
          // alignment: Alignment center(0,0), leftTop(-1,-1), rightTop(1, -1)
          // alignment: FractionalOffset 左上角是0,0
          alignment: FractionalOffset(3, 0),
          child: FlutterLogo(size: 60),
        ),
      ),
    );
  }
}

class Align_Stack_Positioned_Center {
// Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，但它们还是有两个主要区别：
// 1. 定位参考系统不同,
//    Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点
//    Align则需要先通过alignment 参数来确定坐标原点
// 2. 子元素
//    Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠
// Center 组件就是 Align组件设置了 alignment: Alignment.center
}

class ChildrenWidgetDemo extends StatelessWidget {
  const ChildrenWidgetDemo({Key?key, required this.children}) :super(key: key);
  final List<Widget>children;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context, constraints) {
        if(constraints.maxWidth<200){
          return Column(children: children,mainAxisSize: MainAxisSize.min);
        } else {
            var _children = <Widget>[];
            for (var i = 0; i < children.length; i+=2) {
              if(i+1<children.length){
                _children.add(Row(
                  children: [children[i],children[i+1]],
                  mainAxisSize: MainAxisSize.min,
                ));
              } else {
                _children.add(children[i]);
              }
            }
          return Column(
            children: _children,
            mainAxisSize: MainAxisSize.min,
          );
        }
      },
    );
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({Key?key,this.tag, required this.child}) :super(key: key);
  final T? tag;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      assert(() {
        print('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}

class LayoutBuildersWidget extends StatelessWidget {
  const LayoutBuildersWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final List<Widget> children = List.filled(6, const Text('A'));
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuildersWidget-示例')),
      body: Column(
        children: [
          SizedBox(
            width: 190,
            child: ChildrenWidgetDemo(children: children),
          ),
          ChildrenWidgetDemo(children: children),
          LayoutLogPrint(child:Text("xx")),
        ],
      ),
    );
  }
}
