// import 'package:equatable/equatable.dart';
// import 'package:testflutteroneweekly/model/list_product_response_model.dart';
// import 'package:testflutteroneweekly/model/list_sub_category_response_model.dart';
//
// class ShopScreenState extends Equatable {
//   final bool isLoading;
//   final List<SubCategoryModel> listSubCategory;
//   final List<ProductModel> listProduct;
//
//   ShopScreenState({this.isLoading, this.listSubCategory, this.listProduct});
//
//   ShopScreenState defaultState({
//     bool isLoading,
//   }) {
//     return ShopScreenState(
//       isLoading: isLoading ?? this.isLoading,
//       listSubCategory: this.listSubCategory,
//       listProduct: this.listProduct,
//     );
//   }
//
//   ShopScreenState loadData(
//       {bool isLoading,
//       List<SubCategoryModel> listSubCategory,
//       List<ProductModel> listProduct}) {
//     return ShopScreenState(
//       isLoading: isLoading ?? this.isLoading,
//       listSubCategory: listSubCategory ?? this.listSubCategory,
//       listProduct: listProduct ?? this.listProduct,
//     );
//   }
//
//   ShopScreenState changeQuantity(
//       {List<ProductModel> listProduct}) {
//     return ShopScreenState(
//       listProduct: listProduct ?? this.listProduct,
//       isLoading: this.isLoading,
//       listSubCategory: this.listSubCategory,
//     );
//   }
//
//   @override
//   List<Object> get props => [isLoading, listSubCategory, listProduct];
// }
