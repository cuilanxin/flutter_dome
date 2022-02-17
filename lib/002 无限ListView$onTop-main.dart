import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);// 构造函数
  @override // 重写 
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // 数组
  final _saved = Set<WordPair>(); // set 类型对象 不能有重复的
  final _biggerFont = const TextStyle(fontSize: 18); // 样式
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),// left right top right 
      // itemCount: 30, 列表的数量
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();// isOdd 是否是奇数  Divider 分割线
        final index = i ~/ 2; // 向下取整的除法
        if (index >= _suggestions.length) {
          // addAll 数组添加许多个的方法
          _suggestions.addAll(generateWordPairs().take(10));// english_words.dart 包里的方法 生成 10个单词
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair); // contains 判断是否有 pair 元素
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont), // asPascalCase 首字母大写
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair); // 删除 pair
          } else {
            _saved.add(pair); // 添加 pair
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startup Name Generator')),
      body: _buildSuggestions()
    );
  }
}
