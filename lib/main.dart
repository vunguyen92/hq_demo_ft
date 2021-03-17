import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hq_demo_ft/pages/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: RandomWords(),
      home: MainScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color colorPrimary = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomItemsList,
      currentIndex: _selectedIndexBottomBar,
      selectedItemColor: colorPrimary,
      onTap: _onItemTapped,
    );
  }
  int _selectedIndexBottomBar = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexBottomBar = index;
      Fluttertoast.showToast(
        msg: "index = " + index.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    });
  }

  List<BottomNavigationBarItem> bottomItemsList = [
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_homepage.png"),
          color: Colors.grey),
      activeIcon:
      ImageIcon(AssetImage("assets/images/ic_bot_homepage_focus.png")),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_category.png"),
          color: Colors.grey),
      activeIcon:
      ImageIcon(AssetImage("assets/images/ic_bot_category_focus.png")),
      title: Text('Shop'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_messenger.png"),
          color: Colors.grey),
      activeIcon:
      ImageIcon(AssetImage("assets/images/ic_bot_messenger_focus.png")),
      title: Text('Chat'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_shop.png"),
          color: Colors.grey),
      activeIcon: ImageIcon(AssetImage("assets/images/ic_bot_shop_focus.png")),
      title: Text('My Orders'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_account.png"),
          color: Colors.grey),
      activeIcon:
      ImageIcon(AssetImage("assets/images/ic_bot_account_focus.png")),
      title: Text('Account'),
    ),
  ];
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
    return Scaffold (
      appBar: AppBar(
        title: Text('Demo create flutter'),
      ),
      body: _buildSuggestions(),
//      body: new Container(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
        /*itemBuilder: (context, index) {
          *//*return ListTile(
            title: Text("vunh"+ " - " + index.toString()),
          );*//*
        },*/
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
