import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hq_demo_ft/pages/home_page/home_screen.dart';
import 'package:hq_demo_ft/pages/shop_page/shop_screen.dart';

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
      ShopScreen(),
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
      // body: _screenList[_selectedIndexBottomBar],
      body: _screenList[0],
      bottomNavigationBar: _buildBottomBar(),
    );
  }
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.green,
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
      Fluttertoast.showToast(
          msg: "$index",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1
      );
    });
  }

  List<BottomNavigationBarItem> _bottomItemsList = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/ic_bot_homepage.png', width: 24, height: 24, fit: BoxFit.cover,),
      activeIcon: Image.asset('assets/icons/ic_bot_homepage_focus.png', width: 24, height: 24, fit: BoxFit.cover,),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/ic_bot_shop.png', width: 24, height: 24, fit: BoxFit.cover,),
      activeIcon: Image.asset('assets/icons/ic_bot_shop_focus.png', width: 24, height: 24, fit: BoxFit.cover,),
      title: Text('Shop'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/ic_bot_messenger.png', width: 24, height: 24, fit: BoxFit.cover,),
      activeIcon: Image.asset('assets/icons/ic_bot_messenger_focus.png', width: 24, height: 24, fit: BoxFit.cover,),
      title: Text('Chat'),
    ),
  ];
}
