import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Welcome to Flutter', 
      theme: ThemeData(
        // 1.亮度: light-dark
        brightness: Brightness.light,
        // 2.primarySwatch: primaryColor/accentColor的结合体
        primarySwatch: Colors.red,
        // 3.主要颜色: 导航/底部TabBar
        primaryColor: Colors.red,
        // 4.次要颜色: FloatingActionButton/按钮颜色
        accentColor: Colors.orange,
        // 5.卡片主题
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10,
          shape: Border.all(width: 3, color: Colors.red),
          margin: EdgeInsets.all(10)
        ),
        // 6.按钮主题
        buttonTheme: ButtonThemeData(
          minWidth: 0,
          height: 25
        ),
        // 7.文本主题
        textTheme: TextTheme(
          // title: TextStyle(fontSize: 30, color: Colors.blue),
          // display1: TextStyle(fontSize: 10),
        )
      ), // 程序的主题
      home:const RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18);
  void _pushSaved() {
    Navigator.of(context).push( // 路由跳转
      MaterialPageRoute(  // 路由页面
        builder: (context) {
          final tiles = _saved.map((pair){
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont
              ),
            );
          });
          final divided = ListTile.divideTiles(tiles: tiles,context: context).toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }
      )
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[ // 右上角的图标
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list))
        ],
      ),
      body: _buildSuggestions()
    );
  }
}
