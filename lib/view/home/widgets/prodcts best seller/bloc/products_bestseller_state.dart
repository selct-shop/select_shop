part of 'product_bestseller_bloc.dart';

sealed class ProductsBestsellerState extends Equatable {
  const ProductsBestsellerState();
  
  @override
  List<Object> get props => [];
}

final class ProductsBestSellerInitalState extends ProductsBestsellerState {}



  
// home drawer states
final class ProductsBestSellerLoadingState extends ProductsBestsellerState {}
final class ProductsBestSellerSucsessState extends ProductsBestsellerState {
  final List<TheCollectionProduct> bestSellerCollectionProductList;
  final TheCollectionModel theCollectionModel;

  ProductsBestSellerSucsessState({ required this.bestSellerCollectionProductList, 
  required  this.theCollectionModel, 
  
  });
}
final class ProductsBestSellerEmptyState extends ProductsBestsellerState {
  final List<TheCollectionProduct> bestSellerCollectionProductList;
  final TheCollectionModel theCollectionModel;

  ProductsBestSellerEmptyState({ required this.bestSellerCollectionProductList, 
  required this.theCollectionModel, 
  
  }); 
}
final class ProductsBestSellerErrorState extends ProductsBestsellerState {
  final String? errorMessage;
  ProductsBestSellerErrorState({required this.errorMessage});
}
