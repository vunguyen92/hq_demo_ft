// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testflutteroneweekly/model/list_product_response_model.dart';
// import 'package:testflutteroneweekly/model/list_sub_category_response_model.dart';
// import 'package:testflutteroneweekly/pages/shop/shop_screen_event.dart';
// import 'package:testflutteroneweekly/pages/shop/shop_screen_state.dart';
// import 'package:testflutteroneweekly/remote/shop_screen_api.dart';
// import 'package:testflutteroneweekly/widgets/general_dialog.dart';
//
// class ShopScreenBloc extends Bloc<ShopScreenEvent, ShopScreenState> {
//   final shopApi = ShopApi();
//
//   ShopScreenBloc(ShopScreenState initialState) : super(initialState);
//   BuildContext context;
//
//   @override
//   Stream<ShopScreenState> mapEventToState(ShopScreenEvent event) async* {
//     if (event is ShopScreenLoadDataEvent) {
//       yield await _mapEventToGetListBannerState(event, state);
//     } else if (event is ShopScreenChangeQuantityProductEvent) {
//       yield _mapEventChangeQuantityProduct(event, state);
//     }
//   }
//
//   void initContext(BuildContext contextShopScreen) {
//     context = contextShopScreen;
//   }
//
//   Future<ShopScreenState> _mapEventToGetListBannerState(
//       ShopScreenEvent event, ShopScreenState state) async {
//     try {
//       final response = shopApi
//           .getListSubCategory()
//           .timeout(Duration(seconds: 30), onTimeout: () {
//         GeneralDialog.showDialogNotify(context, 'Time out!');
//         return null;
//       });
//
//       List<SubCategoryModel> listSubCategory;
//       List<ProductModel> listProduct;
//       await response.then((responseRaw) async {
//         if (responseRaw.statusCode == 200) {
//           listSubCategory = (json.decode(responseRaw.body) as List)
//               .map((e) => SubCategoryModel(e))
//               .toList();
//
//           /// call api get list connect vendor.
//           listProduct = await getListProduct();
//
//           print(listSubCategory.map((e) => e.toJson()).toList());
//         } else {
//           throw (responseRaw.reasonPhrase);
//         }
//       });
//       return state.loadData(
//         isLoading: false,
//         listSubCategory: listSubCategory,
//         listProduct: listProduct,
//       );
//     } catch (e) {
//       /// handle error and show popup
//       print("Error $e");
//       GeneralDialog.showDialogNotify(context, e);
//       return state.defaultState(isLoading: false);
//     }
//   }
//
//   Future<List<ProductModel>> getListProduct() async {
//     try {
//       /// call api get list Product
//       final responseListProduct = await shopApi
//           .getListProduct()
//           .timeout(Duration(seconds: 30), onTimeout: () {
//         GeneralDialog.showDialogNotify(context, 'Time out!');
//         return null;
//       });
//
//       List<ProductModel> _listProduct;
//       if (responseListProduct.statusCode == 200) {
//         _listProduct =
//             (ListProductResponse(json.decode(responseListProduct.body)))
//                 .listProduct;
//         return _listProduct;
//       } else {
//         throw responseListProduct.reasonPhrase;
//       }
//     } catch (e) {
//       print(e);
//       GeneralDialog.showDialogNotify(context, e);
//       state.defaultState(isLoading: false);
//       return null;
//     }
//   }
//
//   ShopScreenState _mapEventChangeQuantityProduct(
//       ShopScreenChangeQuantityProductEvent event, ShopScreenState state) {
//     if (event.typeChange == ChangeTypeProduct.add) {
//       state.listProduct[event.index].increaseQuantity();
//     } else if (event.typeChange == ChangeTypeProduct.subtract) {
//       state.listProduct[event.index].decreaseQuantity();
//     }
//     List<ProductModel> _listProduct = state.listProduct;
//     return state.changeQuantity(listProduct: _listProduct);
//   }
// }
