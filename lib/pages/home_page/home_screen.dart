import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hq_demo_ft/pages/home_page/home_screen_bloc.dart';
// import 'package:testflutteroneweekly/model/list_banner_response_model.dart';
// import 'package:testflutteroneweekly/model/list_bought_product_response_model.dart';
// import 'package:testflutteroneweekly/model/list_connect_vendor_response_model.dart';
// import 'package:testflutteroneweekly/pages/home/home_screen_bloc.dart';
// import 'package:testflutteroneweekly/pages/home/home_screen_event.dart';
// import 'package:testflutteroneweekly/pages/home/home_screen_state.dart';
// import 'package:testflutteroneweekly/pages/main_screen/main_screen_bloc.dart';
// import 'package:testflutteroneweekly/value/strings.dart';
// import 'package:testflutteroneweekly/widgets/app_loading.dart';
// import 'package:testflutteroneweekly/widgets/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenStateScreen();
  }
}

class HomeScreenStateScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/icons/ic_bot_shop.png', width: 24, height: 24,);
  }
}

// class HomeScreenStateScreen extends State<HomeScreen> {
//   HomeScreenBloc _homeScreenBloc;
//   final _bannerController = PageController(initialPage: 0, keepPage: false);
//   final _scrollHomeScreen = ScrollController();
//   final TextEditingController _searchTextController =
//       new TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _homeScreenBloc = HomeScreenBloc(
//       HomeScreenState(isLoading: true, isTransformAppBar: false),
//     );
//
//     /// init context for bloc and call api
//     _homeScreenBloc.initContext(context);
//     _homeScreenBloc.add(HomeScreenLoadDataEvent());
//
//     _scrollHomeScreen.addListener(() {
//       /// offset: 140 --> transform appbar
//       if (_scrollHomeScreen.offset >= 140) {
//         _homeScreenBloc.add(HomeScreenTransformAppBarEvent(true));
//       } else {
//         _homeScreenBloc.add(HomeScreenTransformAppBarEvent(false));
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _homeScreenBloc,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
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
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             _buildAppBar(),
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollHomeScreen,
//                 padding: EdgeInsets.zero,
//                 physics: ClampingScrollPhysics(),
//                 child: Column(
//                   children: <Widget>[
//                     _buildHeader(),
//
//                     /// Block Connect Vendor
//                     Container(
//                       color: Colors.white,
//                       padding: EdgeInsets.only(top: 10),
//                       child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
//                         builder: (context, state) {
//                           if (state.listConnectVendor != null) {
//                             return _buildBlockConnectVendor(
//                                 state.listConnectVendor);
//                           } else {
//                             return Container();
//                           }
//                         },
//                       ),
//                     ),
//
//                     /// Block Bought Product
//                     Container(
//                       padding: EdgeInsets.only(top: 10),
//                       color: Colors.white,
//                       child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
//                         builder: (context, state) {
//                           if (state.listBoughtProduct != null) {
//                             return _buildBlockBoughtProduct(
//                                 state.listBoughtProduct);
//                           } else {
//                             return Container();
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.elliptical(30, 10),
//                 bottomRight: Radius.elliptical(30, 10),
//               ),
//             ),
//             child: _buildSearchBar(),
//           ),
//
//           /// Block banner
//           Container(
//             margin: EdgeInsets.only(top: 70),
//             child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
//               builder: (context, state) {
//                 if (state.listBanner != null) {
//                   return _buildCarouselBanner(state.listBanner);
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAppBar() {
//     return BlocBuilder<HomeScreenBloc, HomeScreenState>(
//         buildWhen: (previous, current) =>
//             previous.isTransformAppBar != current.isTransformAppBar,
//         builder: (context, state) {
//           bool isTransform =
//               state.isTransformAppBar != null && state.isTransformAppBar;
//           return Container(
//             color: Colors.red,
//             padding: EdgeInsets.only(right: 5),
//             height: 40,
//             child: Row(
//               children: <Widget>[
//                 isTransform
//                     ? _buildSearchBar(
//                         width: MediaQuery.of(context).size.width / 2 + 50,
//                         marginTop: 0,
//                         marginBottom: 2,
//                         marginLeft: 20,
//                         marginRight: 10,
//                       )
//                     : Container(
//                         margin: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width / 2 - 20),
//                         child: Text(
//                           MyStrings.titleHome,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                 Spacer(),
//
//                 /// Button shopping cart
//                 Stack(
//                   children: <Widget>[
//                     Container(
//                       width: 30,
//                       height: 30,
//                       margin: EdgeInsets.only(right: 17),
//                       child: FlatButton(
//                         padding: EdgeInsets.all(0),
//                         onPressed: () {
//                           print(
//                               state.listBanner.map((e) => e.toJson()).toList());
//                         },
//                         child: Icon(
//                           Icons.shopping_cart,
//                           color: Colors.white,
//                           size: 28,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 4,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 16,
//                         height: 16,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                         child: BlocProvider.value(
//                           value: context.bloc<MainScreenBloc>(),
//                           child: Text(
//                             "${context.bloc<MainScreenBloc>().state.quantity ?? 0}",
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontSize: 10,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//
//                 /// Button notification
//                 Stack(
//                   children: <Widget>[
//                     BlocListener<HomeScreenBloc, HomeScreenState>(
//                       listener: (context, state) {},
//                       child: Container(
//                         width: 30,
//                         height: 30,
//                         margin: EdgeInsets.only(right: 17),
//                         child: FlatButton(
//                           padding: EdgeInsets.all(0),
//                           onPressed: () {},
//                           child: Icon(
//                             Icons.notifications,
//                             color: Colors.white,
//                             size: 28,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 4,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 16,
//                         height: 16,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Text(
//                           '5',
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 10,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//         });
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
//   Widget _buildItemBanner(BannerModel model) {
//     return NetWorkImage(
//       width: MediaQuery.of(context).size.width - 40,
//       height: 120,
//       url: model.imageUrl,
//     );
//   }
//
//   Widget _buildCarouselBanner(List<BannerModel> listBanner) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           width: MediaQuery.of(context).size.width - 40,
//           height: 120,
//           margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 2),
//           child: PageView(
//             controller: _bannerController,
//             scrollDirection: Axis.horizontal,
//             children: listBanner.map((e) => _buildItemBanner(e)).toList(),
//             onPageChanged: (index) {
//               _homeScreenBloc.add(HomeScreenPageChangedBannerEvent(index));
//             },
//           ),
//         ),
//         _buildDotForCarouselBanner(listBanner),
//       ],
//     );
//   }
//
//   Widget _buildDotForCarouselBanner(List<BannerModel> listBanner) {
//     return Container(
//       margin: EdgeInsets.only(top: 5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:
//             listBanner.map((e) => _buildItemDotCarousel(e.id - 1)).toList(),
//       ),
//     );
//   }
//
//   Widget _buildItemDotCarousel(int index) {
//     return BlocBuilder<HomeScreenBloc, HomeScreenState>(
//         builder: (context, state) {
//       int _indexCurrent = state.index;
//       return Container(
//         margin: EdgeInsets.only(right: 3),
//         width: 13,
//         height: 4,
//         decoration: BoxDecoration(
//           color: _indexCurrent == index ? Colors.red : Colors.red[200],
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//       );
//     });
//   }
//
//   Widget _buildItemConnectVendor(ConnectVendorModel model) {
//     return Container(
//       margin: EdgeInsets.only(right: 20),
//       child: FlatButton(
//         padding: EdgeInsets.all(0),
//         onPressed: () {},
//         child: NetWorkImage(
//           width: 130,
//           height: 80,
//           url: model.logo,
//           radius: 4,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildListConnectVendor(List<ConnectVendorModel> listConnectVendor) {
//     return ListView.builder(
//       itemCount: listConnectVendor.length,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return _buildItemConnectVendor(listConnectVendor[index]);
//       },
//     );
//   }
//
//   Widget _buildBlockConnectVendor(List<ConnectVendorModel> listConnectVendor) {
//     return Container(
//       height: 200,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 5,
//             color: Colors.grey,
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   child: Text(
//                     MyStrings.titleConnectVendor,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.red,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: FlatButton(
//                     padding: EdgeInsets.all(0),
//                     onPressed: () {},
//                     child: Row(
//                       children: <Widget>[
//                         Text(
//                           MyStrings.btViewMore,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 10),
//                           child: Icon(
//                             Icons.navigate_next,
//                             size: 16,
//                             color: Colors.grey,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//               child: _buildListConnectVendor(listConnectVendor),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildItemBoughtProduct(BoughtProductModel model) {
//     return Container(
//       width: 130,
//       height: 120,
//       margin: EdgeInsets.only(right: 20, top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           NetWorkImage(
//             width: 130,
//             height: 40,
//             url: model.imageBannerUrl,
//             radius: 2,
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 8),
//             child: Text(
//               "${model.name}",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w600,
//               ),
//               maxLines: 2,
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.only(top: 8),
//             child: Text(
//               "P${model.price}",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.red,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGridViewBoughtProduct(
//       List<BoughtProductModel> listBoughtProduct) {
//     return Container(
//       child: GridView.builder(
//           itemCount: listBoughtProduct.length,
//           scrollDirection: Axis.horizontal,
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           itemBuilder: (context, index) {
//             return _buildItemBoughtProduct(listBoughtProduct[index]);
//           }),
//     );
//   }
//
//   Widget _buildBlockBoughtProduct(List<BoughtProductModel> listBoughtProduct) {
//     return Container(
//       height: 340,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 5,
//             color: Colors.grey,
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   child: Text(
//                     MyStrings.titleBoughtProduct,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.red,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: FlatButton(
//                     padding: EdgeInsets.all(0),
//                     onPressed: () {},
//                     child: Row(
//                       children: <Widget>[
//                         Text(
//                           MyStrings.btViewMore,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 10),
//                           child: Icon(
//                             Icons.navigate_next,
//                             size: 16,
//                             color: Colors.grey,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//               child: _buildGridViewBoughtProduct(listBoughtProduct),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
