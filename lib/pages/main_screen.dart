import 'package:flutter/material.dart';
import 'package:hq_demo_ft/pages/home_page/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenStateScreen();
  }
}

class MainScreenStateScreen extends State<MainScreen> {
  List _screenList = [];
  int _selectedIndexBottomBar = 0;
  @override
  void initState() {
    super.initState();
    // _mainScreenBloc = MainScreenBloc(
    //   MainScreenState(index: 0),
    // );

    _screenList = [
      HomeScreen(),
      // ShopScreen(
      //   mainScreenBloc: _mainScreenBloc,
      // ),
      // ChatScreen(),
      // MyOrderScreen(),
      // AccountScreen(),
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndexBottomBar],
        bottomNavigationBar: _buildBottomBar(),
    );
  }
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndexBottomBar,
      onTap: (index) {
        /// push index bottom navigation bar
        // context.bloc<MainScreenBloc>().add(MainScreenChangedBottomBar(index));
        _onItemTapped(index);
      },
      items: _bottomItemsList,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexBottomBar = index;
    });
  }

  List<BottomNavigationBarItem> _bottomItemsList = [
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_homepage.png"), color: Colors.grey),
      // activeIcon: ImageIcon(AssetImage("assets/images/ic_bot_homepage_focus.png")),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_category.png"), color: Colors.grey),
      // activeIcon: ImageIcon(AssetImage("assets/images/ic_bot_category_focus.png")),
      title: Text('Shop'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/ic_bot_messenger.png"), color: Colors.grey),
      // activeIcon: ImageIcon(AssetImage("assets/images/ic_bot_messenger_focus.png")),
      title: Text('Chat'),
    ),
  ];
}
