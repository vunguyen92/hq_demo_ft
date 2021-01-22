// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:testflutteroneweekly/model/list_product_response_model.dart';
// // import 'package:testflutteroneweekly/model/list_sub_category_response_model.dart';
// // import 'package:testflutteroneweekly/pages/main_screen/main_screen_bloc.dart';
// // import 'package:testflutteroneweekly/pages/main_screen/main_screen_event.dart';
// // import 'package:testflutteroneweekly/pages/main_screen/main_screen_state.dart';
// // import 'package:testflutteroneweekly/pages/shop/shop_screen_bloc.dart';
// // import 'package:testflutteroneweekly/pages/shop/shop_screen_event.dart';
// // import 'package:testflutteroneweekly/pages/shop/shop_screen_state.dart';
// // import 'package:testflutteroneweekly/ultis/app_helper.dart';
// // import 'package:testflutteroneweekly/value/icons.dart';
// // import 'package:testflutteroneweekly/value/strings.dart';
// // import 'package:testflutteroneweekly/widgets/app_loading.dart';
// // import 'package:testflutteroneweekly/widgets/cached_network_image.dart';
//
// class ShopScreen extends StatefulWidget {
//   final MainScreenBloc mainScreenBloc;
//
//   const ShopScreen({Key key, this.mainScreenBloc}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return ShopScreenStateScreen();
//   }
// }
//
// class ShopScreenStateScreen extends State<ShopScreen> {
//   MainScreenBloc _mainScreenBloc;
//   final TextEditingController _searchTextController =
//       new TextEditingController();
//
//   ShopScreenBloc _shopScreenBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _shopScreenBloc = ShopScreenBloc(ShopScreenState(isLoading: true));
//     _shopScreenBloc.initContext(context);
//     _shopScreenBloc.add(ShopScreenLoadDataEvent());
//     _mainScreenBloc = widget.mainScreenBloc;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _shopScreenBloc,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: BlocBuilder<ShopScreenBloc, ShopScreenState>(
//             builder: (context, state) {
//           if (state.isLoading) {
//             return AppLoading();
//           } else {
//             return _buildBody();
//           }
//         }),
//       ),
//     );
//   }
//
//   Widget _buildBody() {
//     return SafeArea(
//       top: true,
//       child: GestureDetector(
//         child: BlocBuilder<ShopScreenBloc, ShopScreenState>(
//           builder: (context, state) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 _buildAppBar(),
//                 _buildBlockAllVendor(),
//                 _buildTitleCategory('Nông dược'),
//
//                 /// block list Sub Category
//                 Container(
//                   child: state.listSubCategory != null
//                       ? _buildListSubCategory(state.listSubCategory)
//                       : Container(),
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: state.listProduct != null
//                         ? _buildGridViewProduct(state.listProduct)
//                         : Container(),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//       ),
//     );
//   }
//
//   Widget _buildAppBar() {
//     return Container(
//       padding: EdgeInsets.only(left: 20),
//       width: MediaQuery.of(context).size.width,
//       color: Colors.red,
//       height: 45,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             height: 30,
//             width: 30,
//             child: FlatButton(
//               padding: EdgeInsets.all(0),
//               onPressed: () {
//                 _mainScreenBloc.add(MainScreenChangedBottomBar(0));
//               },
//               child: Container(
//                 child: Icon(
//                   Icons.home,
//                   color: Colors.white,
//                   size: 28,
//                 ),
//               ),
//             ),
//           ),
//           _buildSearchBar(
//             width: MediaQuery.of(context).size.width / 2 + 50,
//             marginLeft: 20,
//             marginTop: 0,
//             marginBottom: 2,
//             marginRight: 10,
//           ),
//           Spacer(),
//           Stack(
//             children: <Widget>[
//               Container(
//                 width: 30,
//                 height: 30,
//                 margin: EdgeInsets.only(right: 17),
//                 child: FlatButton(
//                   padding: EdgeInsets.all(0),
//                   onPressed: () {},
//                   child: Icon(
//                     Icons.shopping_cart,
//                     color: Colors.white,
//                     size: 28,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 right: 4,
//                 child: BlocBuilder<MainScreenBloc, MainScreenState>(
//                     builder: (context, state) {
//                   int _quantity = state.quantity ?? 0;
//                   return Container(
//                     alignment: Alignment.center,
//                     width: 16,
//                     height: 16,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Text(
//                       "$_quantity",
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 10,
//                       ),
//                     ),
//                   );
//                 }),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchBar(
//       {double width,
//       double marginTop,
//       double marginBottom,
//       double marginLeft,
//       double marginRight}) {
//     return Container(
//       margin: EdgeInsets.only(
//         top: marginTop ?? 20,
//         bottom: marginBottom ?? 60,
//         left: marginLeft ?? 20,
//         right: marginRight ?? 20,
//       ),
//       width: width ?? MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(8),
//         ),
//       ),
//       height: 40,
//       child: Row(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(left: 10, right: 10),
//             child: Icon(
//               Icons.search,
//               color: Colors.grey,
//               size: 24,
//             ),
//           ),
//           Container(
//             child: Expanded(
//               child: TextField(
//                 controller: _searchTextController,
//                 decoration: InputDecoration(
//                   hintText: MyStrings.txtSearch,
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   border: InputBorder.none,
//                   filled: false,
//                   isDense: true,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBlockAllVendor() {
//     return Container(
//       padding: EdgeInsets.only(left: 24, right: 20),
//       width: MediaQuery.of(context).size.width,
//       color: Colors.white,
//       height: 45,
//       child: Row(
//         children: <Widget>[
//           Container(
//             child: Container(
//               child: Icon(
//                 Icons.account_balance,
//                 color: Colors.red,
//                 size: 28,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.only(left: 30),
//               child: Text(
//                 MyStrings.txtAllVendor,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             child: Container(
//               child: Icon(
//                 Icons.navigate_next,
//                 color: Colors.black,
//                 size: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTitleCategory(String text) {
//     return Container(
//       padding: EdgeInsets.only(left: 24),
//       width: MediaQuery.of(context).size.width,
//       color: Colors.red,
//       height: 35,
//       child: Row(
//         children: <Widget>[
//           _buildTextTitleCategory(MyStrings.txtCategory),
//           _buildTextNextForTitleCategory(),
//           _buildTextTitleCategory(MyStrings.txtAgriculture),
//           _buildTextNextForTitleCategory(),
//           _buildTextTitleCategory(text),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextTitleCategory(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 16,
//       ),
//     );
//   }
//
//   Widget _buildTextNextForTitleCategory() {
//     return Container(
//       child: Icon(
//         Icons.navigate_next,
//         color: Colors.white,
//         size: 16,
//       ),
//     );
//   }
//
//   Widget _buildItemSubCategory(SubCategoryModel model) {
//     return Container(
//       width: 90,
//       padding: EdgeInsets.all(5),
//       child: RawMaterialButton(
//         onPressed: () {},
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             NetWorkImage(
//               width: 80,
//               height: 70,
//               url: model.image,
//               radius: 2,
//               boxFit: BoxFit.fill,
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 5),
//               child: Text(
//                 model.name,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildListSubCategory(List<SubCategoryModel> listSubCategory) {
//     return Container(
//       color: Colors.white,
//       height: 130,
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.only(left: 5, right: 5),
//       child: ListView.builder(
//           itemCount: listSubCategory.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return _buildItemSubCategory(listSubCategory[index]);
//           }),
//     );
//   }
//
//   Widget _buildItemProduct(ProductModel model, int index) {
//     return BlocBuilder<ShopScreenBloc, ShopScreenState>(
//         builder: (context, state) {
//       return Container(
//         padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           border: Border(
//             top: BorderSide(color: Colors.grey),
//             bottom: BorderSide(color: Colors.grey),
//             left: index % 2 == 0
//                 ? BorderSide.none
//                 : BorderSide(color: Colors.grey),
//             right: index % 2 == 0
//                 ? BorderSide(color: Colors.grey)
//                 : BorderSide.none,
//           ),
//         ),
//         width: MediaQuery.of(context).size.width / 2,
//         //height: 200,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             NetWorkImage(
//               width: MediaQuery.of(context).size.width / 2 - 40,
//               height: 100,
//               url: model.imageBannerUrl,
//               radius: 2,
//               boxFit: BoxFit.fitHeight,
//             ),
//             Container(
//               height: 30,
//               margin: EdgeInsets.only(top: 1),
//               child: Text(
//                 model.name,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                 ),
//                 maxLines: 2,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Container(
//                     child: Text(
//                       "P ${Helper.formatCurrency(model.price)}",
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       "${model.unit}",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 30,
//               margin: EdgeInsets.only(top: 4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Container(
//                     child: Row(
//                       children: <Widget>[
//                         /// button sub
//                         Container(
//                           width: 26,
//                           height: 26,
//                           child: FlatButton(
//                             padding: EdgeInsets.all(4),
//                             onPressed: () {
//                               /// [bug]? change notifier model but BlocBuilder can't rebuild widget in grid when change state. State not change if not scroll grid view
// //                              _shopScreenBloc.add(
// //                                ShopScreenChangeQuantityProductEvent(
// //                                    index: index,
// //                                    typeChange: ChangeTypeProduct.subtract),
// //                              );
//                               setState(() {
//                                 model.decreaseQuantity();
//                               });
//                             },
//                             child: Image.asset(
//                               MyIcons.icSubProduct,
//                               color: Colors.black,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//
//                         /// quantity
//                         Container(
//                           margin: EdgeInsets.only(left: 10, right: 10),
//                           child: Text(
//                             "${model.quantity}",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//
//                         /// button add
//                         Container(
//                           width: 26,
//                           height: 26,
//                           child: FlatButton(
//                             padding: EdgeInsets.all(4),
//                             onPressed: () {
//                               /// [bug]? change notifier model but BlocBuilder can't rebuild widget in grid when change state. State not change if not scroll grid view
// //                              _shopScreenBloc.add(
// //                                ShopScreenChangeQuantityProductEvent(
// //                                    index: index,
// //                                    typeChange: ChangeTypeProduct.add),
// //                              );
//                               setState(() {
//                                 model.increaseQuantity();
//                               });
//                             },
//                             child: Image.asset(
//                               MyIcons.icAddProduct,
//                               color: Colors.black,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     padding: EdgeInsets.only(bottom: 2),
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   /// button cart
//                   Container(
//                     width: 26,
//                     height: 26,
//                     child: FlatButton(
//                       padding: EdgeInsets.zero,
//                       onPressed: () {
//                         _mainScreenBloc
//                             .add(MainScreenUpdateSaveCart(model.quantity));
//                         setState(() {
//                           model.resetQuantity();
//                         });
//                       },
//                       child: Icon(
//                         Icons.shopping_cart,
//                         color: Colors.red,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget _buildGridViewProduct(List<ProductModel> listProduct) {
//     return Container(
//       child: GridView.builder(
//           primary: true,
//           physics: ScrollPhysics(),
//           itemCount: listProduct.length,
//           scrollDirection: Axis.vertical,
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           itemBuilder: (context, index) {
//             return _buildItemProduct(listProduct[index], index);
//           }),
//     );
//   }
// }

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hq_demo_ft/values/default_value.dart';

class ShopScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShopScreenState();
  }
}

class ShopScreenState extends State<ShopScreen> {
  int _counter = 0;
  bool _showClearButton = false;
  Color _colorPrimary = Colors.lightBlueAccent;
  TextEditingController _textController = new TextEditingController();

  List<String> titleCategory;
  List<ImageMidView> imageListMidView;
  List<ImageBottomView> imageListBotView;

  @override
  void initState() {
    super.initState();
    titleCategory = DefaultValueModel.titleCategory;
    imageListMidView = DefaultValueModel.imageListMidView;
    imageListBotView = DefaultValueModel.imageListBotView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 70,
        elevation: 0,
        title: searchCombo(),
        centerTitle: true,
        backgroundColor: _colorPrimary,
        /*leading: GestureDetector(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Icon(
            Icons.home, // add custom icons also
          ),
        ),*/
        leading: IconButton(
          icon: Icon(
            Icons.home, // add custom icons also
          ),
          onPressed: () {
            _toastText('home');
          },
        ),
        actions: <Widget>[
          iconAppBarButton(Icon(Icons.shopping_cart), _counter),
          // iconButton(Icon(Icons.shopping_cart), _counter),
        ],
      ),
      body: GestureDetector(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerView(),
            categoryTitle(),
            listSubCategory(),
            Container(height: 3, color: Colors.grey, margin: EdgeInsets.fromLTRB(0, 10, 0, 10),),
            Expanded(
              child: builBottomGridView(),
            )
          ],
        ),
        onTap: () {
          _toastText('_body');
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  void _incrementCartShopping(int qty) {
    setState(() {
      _counter += qty;
    });
  }

  Widget searchCombo() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(10)),
      ),
      child: TextFormField(
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
          contentPadding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
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

  Widget iconAppBarButton(Icon icons, int _counter) {
    if (_counter != 0) {
      return Container(
        child: Badge(
          badgeContent: Text("$_counter"),
          badgeColor: Colors.white,
          child: IconButton(
            icon: icons,
            onPressed: () {
              _toastText('$_counter');
            },
          ),
        ),
        margin: EdgeInsets.only(right: 10, top: 8),
      );
    } else {
      return Container(
        child: IconButton(
          icon: icons,
          onPressed: () {
            _toastText('$_counter');
          },
        ),
        margin: EdgeInsets.only(right: 10, top: 8),
      );
    }
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

  Widget headerView() {
    return Container(
      height: 50,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance,
                          color: _colorPrimary,
                        )
                      ],
                    ),
                  ),
                  Text('All Vendors',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      )),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: viewMoreButton(true),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget viewMoreButton(bool enable) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: enable ? 5 : 0),
        child: Row(
          children: [
            Icon(
              Icons.navigate_next,
              color: enable ? Colors.grey : Colors.white,
            )
          ],
        ),
      ),
      onTap: () {
        if (enable) {
          print("tap view more ALL");
          _toastText('tap view more ALL');
        } else {
          print("ko lam gi het");
          _toastText('ko lam gi het');
        }
      },
    );
  }

  Widget categoryTitle() {
    return Container(
      color: _colorPrimary,
      height: 50,
      child: Container(
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  for (int i = 0; i < titleCategory.length; i++)
                    textAndIcon(titleCategory[i], i),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textAndIcon(String text, int index) {
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 8 : 0),
      child: Row(
        children: [
          InkWell(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              print(text);
              _toastText(text);
            },
          ),
          index == titleCategory.length - 1
              ? Container()
              : viewMoreButton(false),
        ],
      ),
    );
  }

  Widget listSubCategory() {
    return Container(
      height: 120,
      child: _buildMidListView(),
    );
  }

  Widget _buildMidListView() {
    return ListView.builder(
      itemCount: imageListMidView.length,
//        physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return itemListMidView(imageListMidView[index]);
      },
    );
  }

  Widget itemListMidView(ImageMidView obj) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          height: 120,
          // width: 100,
          child: Column(
            children: [
              imageListMidView.length > 0
                  ? Container(
                height: 80,
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
        _toastText(obj.name);
      },
    );
  }

  Widget builBottomGridView() {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,

      shrinkWrap: true,
      children: List.generate(imageListBotView.length, (index) {
        return Center(
          child: itemBottomGridView(
            imageListBotView[index],
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
          // height: 350,
          // width: 250,
          child: Column(
            children: [
              imageListBotView.length > 0
                  ? Expanded(
                // height: 100,
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
        _toastText(obj.name);
      },
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
}