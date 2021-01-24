import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hq_demo_ft/pages/home_page/home_screen_bloc.dart';
import 'package:hq_demo_ft/values/default_value.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenStateScreen();
  }
}

class HomeScreenStateScreen extends State<HomeScreen> {
  Color _colorPrimary = Colors.cyan;
  String _title = 'nRetail';
  int _counter = 0;
  bool _showClearButton = false;
  TextEditingController _textController = new TextEditingController();
  PageController pageController;
  List<String> imageList;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    imageList = DefaultValueModel.imageList;
    pageController = PageController(initialPage: 0, viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: _colorPrimary,
              pinned: true,
              expandedHeight: 150,
              centerTitle: true,
              title: Container(
                margin: EdgeInsets.only(right: 8, top: 11),
                child: Text(_title),
              ),
              actions: <Widget>[
                iconAppBarButton(Icon(Icons.shopping_cart), _counter, 1),
                iconAppBarButton(Icon(Icons.notifications), 0, 2),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(10))),
                  child: searchCombo(),
                ),
              ),
            ),
            SliverList(delegate: new SliverChildListDelegate(_buildList())),
          ],
          physics: ClampingScrollPhysics(),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          _toastText('_body');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.shopping_cart),
      ), // T
    );
  }

  Widget iconAppBarButton(Icon icons, int _counter, int position) {
    if (_counter < 10 && _counter != 0) {
      return Container(
        child: Badge(
          badgeContent: Text("$_counter"),
          badgeColor: Colors.white,
          child: IconButton(
            icon: icons,
            onPressed: () {
              _toastText('$_counter' + ' '+ position.toString() + ' - badge');
            },
          ),
        ),
        margin: EdgeInsets.only(right: 10, top: 11),
      );
    } else {
      return Container(
        child: IconButton(
          icon: icons,
          onPressed: () {
            _toastText('$_counter' + ' ' + position.toString() + ' - not');
          },
        ),
        margin: EdgeInsets.only(right: 10, top: 11),
      );
    }
  }

  Widget searchCombo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(10)),
      ),
      child: TextFormField(
        style: TextStyle(fontSize: 13.0),
        keyboardType: TextInputType.text,
//      maxLength: 250,
        maxLines: 1,
        cursorColor: Colors.red,
        controller: _textController,
        onChanged: (value) {
          setState(() {
            _showClearButton = _textController.text != "" ? true : false;
          });
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: clearTextButton(),
          hintText: "Search",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  Widget clearTextButton() {
    if (!_showClearButton) {
      return null;
    } else {
      return IconButton(
        onPressed: () {
          setState(() {
            _textController.clear();
            _showClearButton = _textController.text != "" ? true : false;
          });
        },
        icon: Icon(
          Icons.clear,
          color: Colors.grey,
        ),
      );
    }
  }

  List _buildList() {
    List<Widget> listItems = List();

    listItems.add(topView());
    // listItems.add(saperatorView());
    // listItems.add(midView());
    // listItems.add(saperatorView());
    // listItems.add(BottomView());

    return listItems;
  }

  Widget topView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: _colorPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            height: 50,
            width: MediaQuery.of(context).size.width,
          ),
          Column(children: [
            Container(
              height: 150,
              margin: EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: PageView.builder(
                  controller: pageController,
                  itemCount: imageList.length,
                  onPageChanged: (page) {
                    setState(
                          () {
                        _currentPage = page;
                      },
                    );
                    print("page: " + "$page");
                  },
                  itemBuilder: (context, position) {
                    return imageSlider(position);
                  }),
            ),
            Container(
              color: Colors.white,
              child: pageView(),
            ),
          ]),
        ],
      ),
    );
  }

  Widget imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        // HIEU UNG CHO DEP
//        double value = 1;
//        if (pageController.position.haveDimensions) {
//          value = pageController.page - index;
//          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
//        }

        return Center(
          child: SizedBox(
            //height: Curves.easeInOut.transform(value)*(120),
//            width: Curves.easeInOut.transform(value)*(double.infinity),
            height: double.infinity,
            width: double.infinity,
            child: widget,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 1,
          left: 1,
        ),
        child: imageList.length > 0
            ? ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(imageList[index], fit: BoxFit.fill),
        )
            : null,
      ),
    );
  }

  Widget pageView() {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Container(
//          margin: EdgeInsets.only(bottom: 35),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < imageList.length; i++)
                if (i == _currentPage) ...[circleBar(true)] else
                  circleBar(false),
            ],
          ),
        ),
      ],
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 6 : 5,
      width: isActive ? 17 : 15,
      decoration: BoxDecoration(
        color: isActive ? _colorPrimary : _colorPrimary.withOpacity(.4),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }

  void _toastText(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter < 10 ? _counter++ : _counter = 0;
    });
  }
}
