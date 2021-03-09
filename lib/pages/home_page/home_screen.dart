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
  List<String> _imageList;
  List<ImageMidView> _imageListMidView;
  List<ImageBottomView> _imageListBotView;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _imageList = DefaultValueModel.imageList;
    _imageListMidView = DefaultValueModel.imageListMidView;
    _imageListBotView = DefaultValueModel.imageListBotView;
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
              backgroundColor: Colors.blueAccent,
              pinned: true,
              expandedHeight: 150,
              // centerTitle: true,
              /*title: Container(
                margin: EdgeInsets.only(right: 8, top: 11),
                child: Text(_title),
              ),*/
              /*actions: <Widget>[
                iconBadgeAppBarButton(Icon(Icons.shopping_cart), _counter),
                iconNotifyAppBarButton(Icon(Icons.notifications), 0),
              ],*/
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(new Radius.circular(10))),
                  child: searchCombo(),
                ),
                background: appBar(),
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

  Widget appBar(){
    return AppBar(
      centerTitle: true,
      title: Text(_title),
      backgroundColor: Colors.red,
      actions: <Widget>[
        iconBadgeAppBarButton(Icon(Icons.shopping_cart), _counter),
        iconNotifyAppBarButton(Icon(Icons.notifications), 0),
      ],
    );
  }

  Widget iconBadgeAppBarButton(Icon icons, int _counter) {
    if ( _counter > 0 ) {
      return Container(
        child: Badge(
          badgeContent: Text("$_counter"),
          badgeColor: Colors.white,
          child: IconButton(
            icon: icons,
            onPressed: () {
              _toastText('$_counter' + ' - badge');
            },
          ),
        ),
        margin: EdgeInsets.only(right: 10, top: 11),
      );
    }else {
      return Container(
        child: IconButton(
          icon: icons,
          onPressed: () {
            _toastText('$_counter' + ' - badge');
          },
        ),
        margin: EdgeInsets.only(right: 10, top: 11),
      );
    }
  }

  Widget iconNotifyAppBarButton(Icon icons, int _counter) {
    if (_counter > 0 ) {
      return Container(
        child: IconButton(
          icon: icons,
          onPressed: () {
            _toastText('$_counter' + ' - notify');
          },
        ),
        margin: EdgeInsets.only(right: 10, top: 11),
      );
    }else {
      return Container(
        child: IconButton(
          icon: icons,
          onPressed: () {
            _toastText('$_counter' + ' - notify');
          },
        ),
        margin: EdgeInsets.only(right: 10, top: 11),
      );
    }
  }

  Widget searchCombo() {
    return Container(
      height: 35,
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
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
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
    listItems.add(saperatorView());
    listItems.add(midView());
    listItems.add(saperatorView());
    listItems.add(bottomView());

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
                  itemCount: _imageList.length,
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

  Widget saperatorView() {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 5, bottom: 5),
      color: Colors.grey[300],
    );
  }

  Widget midView() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "CONNECTED VENDORS",
                    style: TextStyle(
                      color: _colorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                viewMoreButton(true)
              ],
            ),
          ),
          Expanded(
            child: buildMidListView(),
          )
        ],
      ),
    );
  }

  Widget viewMoreButton(bool isMidView) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Text(
              "View More",
              style: TextStyle(color: Colors.grey),
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.grey,
            )
          ],
        ),
      ),
      onTap: () {
        if (isMidView) {
          print("tap view more mid view");
          /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return detailScreen();
                  *//*Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('detailScreen'))
                  );*//*
                },
              ));*/
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('detailScreen'))
          );
        } else {
          print("tap view more bottom view");
        }
      },
    );
  }

  Widget buildMidListView() {
    return ListView.builder(
      itemCount: _imageListMidView.length,
//        physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return itemListMidView(_imageListMidView[index]);
      },
    );
  }

  Widget itemListMidView(ImageMidView obj) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          height: 150,
          width: 250,
          child: Column(
            children: [
              _imageListMidView.length > 0
                  ? Container(
                height: 150,
                child: Image.network(obj.url, fit: BoxFit.fill),
              )
                  : null,
              Text(obj.name)
            ],
          ),
        ),
      ),
      onTap: () {
        print(obj.name);
      },
    );
  }

  Widget bottomView() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "BOUGHT PRODUCTS",
                    style: TextStyle(
                      color: _colorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                viewMoreButton(false)
              ],
            ),
          ),
          Expanded(
            child: builBottomGridView(),
          )
        ],
      ),
    );
  }

  Widget builBottomGridView() {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: List.generate(_imageListBotView.length, (index) {
        return Center(
          child: itemBottomGridView(
            _imageListBotView[index],
          ),
        );
      }),
    );
  }

  Widget itemBottomGridView(ImageBottomView obj) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              _imageListBotView.length > 0
                  ? Container(
                // height: 150,
                child: Image.network(obj.url, fit: BoxFit.scaleDown),
              )
                  : null,
              Text(obj.name),
              Text(
                obj.price,
                style: TextStyle(color: _colorPrimary),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print(obj.name);
      },
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
        child: _imageList.length > 0
            ? ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(_imageList[index], fit: BoxFit.fill),
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
              for (int i = 0; i < _imageList.length; i++)
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
