part of 'products_discounts_bloc.dart';

sealed class ProductsDiscountsState extends Equatable {
  const ProductsDiscountsState();

  @override
  List<Object> get props => [];
}

final class ProductsDiscountInitalState extends ProductsDiscountsState {}

final class ProductsDiscountLoadingState extends ProductsDiscountsState {}

///
///
///
///
///
// final class ProductsDiscountSucsessState extends ProductsDiscountsState {
//   final List<TheProductModel> newProductCollectionList;
//   ProductsDiscountSucsessState({required this.newProductCollectionList});
// }

// final class ProductsDiscountEmptyState extends ProductsDiscountsState {
//   final List<TheProductModel> newProductCollectionList;
//   ProductsDiscountEmptyState({required this.newProductCollectionList});
// }

///
///
///
///
///

final class ProductsDiscountSucsessState extends ProductsDiscountsState {
  final List<TheCollectionProduct> newProductCollectionList;
  final TheCollectionModel theCollectionModel;

  ProductsDiscountSucsessState({ required this.newProductCollectionList, 
  required this.theCollectionModel, 
  });
}
final class ProductsDiscountEmptyState extends ProductsDiscountsState {
  final List<TheCollectionProduct> newProductCollectionList;
  final TheCollectionModel theCollectionModel;
  
  ProductsDiscountEmptyState({ required this.newProductCollectionList, 
  required this.theCollectionModel, 
  });
}

///
///
///
///
///
final class ProductDiscountErrorState extends ProductsDiscountsState {
  final String? errorMessage;
  ProductDiscountErrorState({required this.errorMessage});
}
