// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testflutteroneweekly/model/list_banner_response_model.dart';
// import 'package:testflutteroneweekly/model/list_bought_product_response_model.dart';
// import 'package:testflutteroneweekly/model/list_connect_vendor_response_model.dart';
// import 'package:testflutteroneweekly/pages/home/home_screen_event.dart';
// import 'package:testflutteroneweekly/pages/home/home_screen_state.dart';
// import 'package:testflutteroneweekly/remote/home_screen_api.dart';
// import 'package:testflutteroneweekly/widgets/general_dialog.dart';
//
// class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
//   final homeApi = HomeScreenApi();
//   BuildContext context;
//
//   HomeScreenBloc(HomeScreenState initialState) : super(initialState);
//
//   @override
//   Stream<HomeScreenState> mapEventToState(HomeScreenEvent event) async* {
//     if (event is HomeScreenLoadDataEvent) {
//       yield await _mapEventToGetListBannerState(event, state);
//     } else if (event is HomeScreenPageChangedBannerEvent) {
//       yield _mapEventPageChangedBanner(event, state);
//     } else if (event is HomeScreenTransformAppBarEvent) {
//       yield _mapEventTransformAppbar(event, state);
//     }
//   }
//
//   void initContext(BuildContext contextHomeScreen) {
//     context = contextHomeScreen;
//   }
//
//   Future<HomeScreenState> _mapEventToGetListBannerState(
//       HomeScreenEvent event, HomeScreenState state) async {
//     try {
//       final response =
//           homeApi.getListBanner().timeout(Duration(seconds: 30), onTimeout: () {
//         print("Time out!");
//         return null;
//       });
//
//       List<BannerModel> listBanner;
//       List<ConnectVendorModel> listConnectVendor;
//       List<BoughtProductModel> listBoughtProduct;
//       await response.then((responseRaw) async {
//         if (responseRaw.statusCode == 200) {
//           listBanner = (json.decode(responseRaw.body) as List)
//               .map((e) => BannerModel(e))
//               .toList();
//
//           /// call api get list connect vendor.
//           listConnectVendor = await getConnectVendor();
//
//           /// call api get list bought product
//           listBoughtProduct = await getBoughtProduct();
//
//           print(listBanner.map((e) => e.toJson()).toList());
//           print(listConnectVendor.map((e) => e.toJson()).toList());
//           print(listBoughtProduct.map((e) => e.toJson()).toList());
//         } else {
//           throw (responseRaw.reasonPhrase);
//         }
//       });
//       return state.loadData(
//         listBanner: listBanner,
//         isLoading: false,
//         index: 0,
//         listConnectVendor: listConnectVendor,
//         listBoughtProduct: listBoughtProduct,
//       );
//     } catch (e) {
//       /// handle error and show popup
//       print("Error $e");
//       GeneralDialog.showDialogNotify(context, e);
//       return state.copyWith(isLoading: false);
//     }
//   }
//
//   HomeScreenState _mapEventPageChangedBanner(
//       HomeScreenPageChangedBannerEvent event, HomeScreenState state) {
//     return state.pageListBannerChange(index: event.index);
//   }
//
//   /// Function call api connect vendor
//   Future<List<ConnectVendorModel>> getConnectVendor() async {
//     try {
//       /// call api get connect vendor
//       final responseConnectVendor = await homeApi
//           .getConnectVendor(4, 10202)
//           .timeout(Duration(seconds: 30), onTimeout: () {
//         print("Time out!");
//         return null;
//       });
//
//       List<ConnectVendorModel> _listConnectVendor;
//       if (responseConnectVendor.statusCode == 200) {
//         _listConnectVendor = (json.decode(responseConnectVendor.body) as List)
//             .map((e) => ConnectVendorModel(e))
//             .toList();
//         return _listConnectVendor;
//       } else {
//         throw responseConnectVendor.body;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   Future<List<BoughtProductModel>> getBoughtProduct() async {
//     try {
//       /// call api get bought product
//       final responseBoughtProduct = await homeApi
//           .getBoughtProduct(4, 10, 0)
//           .timeout(Duration(seconds: 30), onTimeout: () {
//         print("Time out!");
//         return null;
//       });
//
//       List<BoughtProductModel> _listBoughtProduct;
//       if (responseBoughtProduct.statusCode == 200) {
//         _listBoughtProduct =
//             ListBoughtProductResponse(json.decode(responseBoughtProduct.body))
//                 .listBoughtProduct;
//         return _listBoughtProduct;
//       } else {
//         throw responseBoughtProduct.body;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   HomeScreenState _mapEventTransformAppbar(
//       HomeScreenTransformAppBarEvent event, HomeScreenState state) {
//     return state.transformAppbar(transform: event.transform);
//   }
// }
